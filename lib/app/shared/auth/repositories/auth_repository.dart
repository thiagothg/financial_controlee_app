import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/errors/register_error_interceptor.dart';
import '../../../core/responses/response_builder.dart';
import '../../../core/responses/response_default.dart';
import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final fb = FacebookLogin();

  @override
  Future<DefaultResponse> getEmailPasswordLogin(
      {String email, String password}) async {
     try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      return ResponseBuilder.success<User>(
          object: await _auth.currentUser);
    } on PlatformException catch (e) {
      var message = RegisterErrorInterceptor().handleAuthError(e.code);
      return ResponseBuilder.failed(object: e, message: message);
    } on FirebaseAuthException catch(e) {
      var message = RegisterErrorInterceptor().handleAuthError(e.code);
      return ResponseBuilder.failed(object: e, message: message);
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> getFacebookLogin() async {
    try {
      print('starting facebook login');

      final res = await fb.logIn(
        permissions: [
          FacebookPermission.publicProfile,
          FacebookPermission.email,
        ]
      );

      switch(res.status) {
        case FacebookLoginStatus.Success:
          print('It worked');

          //Get Token
          final fbToken = res.accessToken;

          //Convert to Auth Credential
          final credential = FacebookAuthProvider
            .credential(fbToken.token);

          //User Credential to Sign in with Firebase
          final result = await _auth.signInWithCredential(credential);

          print('${result.user.displayName} is now logged in');
          return ResponseBuilder.success<User>(
            object: result.user, message: 'Logou com sucesso');

          break;
        case FacebookLoginStatus.Cancel:
          print('The user canceled the login');
            throw('Cancel login Facebook');
          break;
        case FacebookLoginStatus.Error:
          print('There was an error');
           throw(res.error);
          break;
    }

    throw('Ocorreu um erro');
    } on Exception catch (e) {
      return ResponseBuilder.failed(
          object: e, 
          message: 'Falha ao Logar com FaceBook. e: ${e.toString()}');
    }
  }

  @override
  Future<String> getToken() {
    throw UnimplementedError();
  }

  @override
  Future<DefaultResponse> getGoogleLogin() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final user =
          (await _auth.signInWithCredential(credential)).user;

      return ResponseBuilder.success<User>(
          object: user, message: 'Logou com sucesso');
    } on Exception catch (e) {
      return ResponseBuilder.failed(
          object: e, message: 'Falha ao Logar com Google. e: ${e.toString()}');
    }
  }

  @override
  Future<DefaultResponse> getUser() async {
    try {
      return ResponseBuilder.success<User>(
          object: await _auth.currentUser);
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> getLogout() async {
    try {
      await _auth.signOut();
      return ResponseBuilder.success();
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password}) async {
    try {
      return await _auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then(
        (auth) {
          return ResponseBuilder.success<User>(object: auth.user);
        },
      );
    } on Exception catch (e) {
      return ResponseBuilder.failed(
          object: e,
          message: e.toString(),
          errorInterceptor: RegisterErrorInterceptor());
    }
  }

  @override
  Future<DefaultResponse> forgetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return ResponseBuilder.success<String>(object: 'ok');
      
    } on FirebaseAuthException catch(e) {
      var message = RegisterErrorInterceptor().handleAuthError(e.code);
      return ResponseBuilder.failed(object: e, message: message);
    } on Exception catch (e) {
      return ResponseBuilder.failed(
        object: e,
        message: e.toString());
    }
  }
}
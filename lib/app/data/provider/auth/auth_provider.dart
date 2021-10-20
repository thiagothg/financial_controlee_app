import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../model/auth_model.dart';
import '../../model/user_model.dart';
import '../../../global/core/services/gql_client.dart';
import '../../../global/documents/user_doc.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../global/utils/utils.dart';

class AuthProvider {
  final firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GraphQLClient _gqlClient;

  AuthProvider(this._gqlClient) {
    auth.setLanguageCode(Get.locale!.languageCode);
  }

  String getDeviceType() {
    String type = 'web';

    if (Platform.isIOS) {
      type = 'ios';
    }

    if (Platform.isAndroid) {
      type = 'android';
    }

    return type;
  }

  Stream<Auth?> get authStatus => auth.authStateChanges().map((user) {
        if (user != null) {
          var auth = Auth(
            expiresIn: 0,
            accessToken: user.refreshToken!,
            tokenType: '${user.tenantId}',
            user: User(
                id: user.uid,
                name: user.displayName ?? '',
                email: user.email ?? '',
                urlImage: user.photoURL),
          );
          return auth;
        }
      });

  ///
  Future<User?> signup(String email, String password, String name) async {
    try {
      var credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await credential.user!.sendEmailVerification();

      credential.user?.updateDisplayName(name);
      credential.user?.reload();

      var user = User(
        id: credential.user!.uid,
        name: name,
        email: email,
        urlImage: credential.user?.photoURL,
      );

      // userRepository
      await saveUserInfo(user);
    } on firebase_auth.FirebaseAuthException catch (e) {
      Utils.safePrint('${e.message} - ${e.code} - ${e.toString()}');
      var errorMessage = '';

      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'The account already exists for that email.';
          break;
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        case 'invalid-email':
          errorMessage = 'Email invalido.';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Error';
          break;
        default:
          throw ('error');
      }
      throw (errorMessage);
    } catch (e) {
      Utils.safePrint(e.toString());

      rethrow;
    }
  }

  ///
  Future<User?> login(String email, String password) async {
    try {
      var credential = await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      return User(
          id: credential.user!.uid,
          name: credential.user?.displayName ?? '',
          email: email,
          urlImage: credential.user?.photoURL);
    } on firebase_auth.FirebaseAuthException catch (e) {
      Utils.safePrint('${e.message} - ${e.toString()}');
      var errorMessage = '';

      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Your password is wrong.";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }

      throw (errorMessage);
    } catch (e) {
      Utils.safePrint('${e.toString()} - ${e.toString()}');
      rethrow;
    }
  }

  ///
  Future<void> logout() async {
    await auth.signOut();
  }

  ///
  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (err) {
      Utils.safePrint(err.toString());
      switch (err.code) {
        case 'auth/invalid-email':
          throw ('Email inválido');
        case 'auth/missing-android-pkg-name':
          throw ('Email inválido');
        case 'user-not-found':
          throw ('E-mail não encontrado.');
        default:
          throw ('error');
      }
    }
  }

  ///
  Future<User?> signInWithGoogle() async {
    try {
      final firebase_auth.UserCredential userCredential;

      if (kIsWeb) {
        final credential = firebase_auth.GoogleAuthProvider();

        credential
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        credential.setCustomParameters({'login_hint': 'user@example.com'});

        userCredential = await auth.signInWithPopup(credential);
      } else {
        // Trigger the authentication flow
        final googleUser = await googleSignIn.signIn();

        // Obtain the auth details from the request
        final googleAuth = await googleUser!.authentication;

        // Create a new credential
        final credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        userCredential = await auth.signInWithCredential(credential);
      }

      // Once signed in, return the UserCredential
      // await userCredential.user!.sendEmailVerification();
      var user = User(
          id: userCredential.user!.uid,
          // id: userCredential.user!.uid,
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          urlImage: userCredential.user!.photoURL!);

      /// create user
      await saveUserInfo(user);

      return user;
    } catch (e) {
      await googleSignIn.signOut();
      await logout();
      Utils.safePrint(e.toString());
      rethrow;
    }
  }

  ///
  Future<User?> signInFacebook() async {
    try {
      final LoginResult result = await facebookAuth.login();

      switch (result.status) {
        case LoginStatus.success:
          final credential = firebase_auth.FacebookAuthProvider.credential(
              result.accessToken!.token);
          // Once signed in, return the UserCredential
          final userCredential = await auth.signInWithCredential(credential);

          var user = User(
              id: userCredential.user!.uid,
              name: userCredential.user!.displayName!,
              email: userCredential.user!.email!,
              urlImage: userCredential.user!.photoURL!);

          /// create user
          await saveUserInfo(user);

          return user;
        case LoginStatus.failed:
          throw Exception('failed');
        case LoginStatus.cancelled:
          throw Exception('cancelled');
        default:
          throw Exception('Error');
      }
    } catch (e) {
      await facebookAuth.logOut();
      await logout();
      Utils.safePrint(e.toString());
      rethrow;
    }
  }

  ///
  Future<User?> signInApple() async {
    try {
      if (!await SignInWithApple.isAvailable()) {
        throw Exception('Apple login is not available');
      }

      final result = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: '',
          redirectUri: Uri.parse(
              'https://financial-controlee-app.firebaseapp.com/__/auth/handler'),
        ),
      );
    } catch (e) {
      Utils.safePrint(e.toString());
      rethrow;
    }
  }

  Future<bool> saveUserInfo(User user) async {
    try {
      var data = user.toJson();

      return await _gqlClient.connect.mutation(saveUserInfoMutation,
          variables: {'object': data}).then((res) => (res['data']
              ['insert_FINANCIAL_APP_TB_USERS_one']['id'] !=
          null));
    } on HasuraRequestError catch (err) {
      Utils.safePrint('${err.message} - ${err.request} -- ${err.toString()}');
      rethrow;
    }
  }
}



import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/consts/routers_const.dart';
import '../../core/enums/app_enums.dart';
import '../../core/responses/response_default.dart';
import '../../models/user_model.dart';
import '../../repositories/user_repository.dart';
import '../utils/global_scaffold.dart';
import 'repositories/auth_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {

  final IAuthRepository _authRepository = Modular.get();
  final UserRepository _userRepository = Modular.get();

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser).catchError((e) {
      print('ERRORRRRRR');
    });
  }

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  User user;

  @observable
  UserModel userModel = UserModel();

  @action
  void setUser(DefaultResponse result) {
    if(result.success && result.object != null) {
      status = AuthStatus.login;
      user = result.object;
      userModel = UserModel.toModelFirebaseUser(user);
     
      print(userModel);
    } else {
      status = AuthStatus.logoff;
    }
  }


  @action
  Future loginWithGoogle() async {
   await _authRepository.getGoogleLogin().then((result) async {
     if(result.success) {
      await createUser(result.object);
      userModel = UserModel.toModelFirebaseUser(user);
      Modular.to.pushReplacementNamed(RoutersConst.home);
     } else {
        final snackBar = SnackBar(
         content: Text(result.message.toString())
        );
        GlobalScaffold.instance.showSnackBar(snackBar);
        print(result);
     }
   });
  }

  Future logout() async {
    var response = await _authRepository.getLogout();
    if (response.success) {
      status = AuthStatus.logoff;
      Modular.to.pushReplacementNamed(RoutersConst.login);
    } else {
      print(response.message);
      throw response;
    }
  }

  Future<DefaultResponse> loginEmail(String email, String password) async {
    var result = await _authRepository
        .getEmailPasswordLogin(email: email.trim(), password: password.trim());
    print(result.message);
    //RegisterErrorInterceptor().handleAuthError(result.object);
    return result;
  }

  Future<void> register(String email, String password) async {
    var response = await _authRepository.registerEmailPassword(
      email: email,
      password: password,
    );
    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConst.home);
    } else {
      throw response;
    }
  }

  Future<void> createUser(User user) async {
    if(!await _userRepository.exists(user.uid)) {
      userModel = UserModel(
        name: user.displayName,
        email: user.email,
        photoUrl: user.photoURL
      );

      userModel.id = user.uid;

      await _userRepository.create(userModel);
    }
  }

  Future<DefaultResponse> getUser() async {
    return await _authRepository.getUser();
  }
}
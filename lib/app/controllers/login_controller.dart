import 'dart:async';

import 'package:financialcontroleeapp/app/shared/utils/global_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../core/consts/routers_const.dart';
import '../shared/auth/auth_controller.dart';
import 'package:loading_animations/loading_animations.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController auth = Modular.get();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  @observable
  BuildContext context;

  @observable
  ProgressDialog pr;

  @observable
  bool loading = false;

  @observable
  String email = '';

  // ignore: use_setters_to_change_properties
  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  // ignore: use_setters_to_change_properties
  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @computed
  bool get isEmailValid =>
    RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email.trim());

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  Function get loginPressed =>
      (isEmailValid && isPasswordValid && !loading) ? login : null;


  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await auth.loginWithGoogle();
     } on Exception catch (e) {
      loading = false;
      print(e);
    }
  }

  @action
  Future<void> login() async {
    loading = true;
    
    pr.show();
    await auth.loginEmail(email, password)
      .then((result) async {
      
      if(result.success) {
        Modular.to.pushReplacementNamed(RoutersConst.home);
      } else {
        await Future.delayed(Duration(seconds: 2));

        loading = false;
        pr.hide();
        GlobalScaffold.instance.showSnackBar(SnackBar(
          content: Text(result.message),
          duration: Duration(seconds: 2),
          backgroundColor: Theme.of(context).errorColor,
        ));
      }
    });
  }

  @action 
  Future<void> forgetPassword() async {
    if(email.isNotEmpty) {
      await pr.show();
      var result = await auth.forgetPassword(email.trim());
      await pr.hide();
      if(result.success) {
         GlobalScaffold.instance.showSnackBar(SnackBar(
          content: Text('Email enviado com sucesso'),
          duration: Duration(seconds: 2),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ));
      } else {
        // print(result.);
         GlobalScaffold.instance.showSnackBar(SnackBar(
          content: Text(result.message),
          duration: Duration(seconds: 2),
          backgroundColor: Theme.of(context).errorColor,
        ));
      }
    } else {
      GlobalScaffold.instance.showSnackBar(SnackBar(
        content: Text('Preencha o email'),
        duration: Duration(seconds: 2),
        backgroundColor: Theme.of(context).errorColor,
      ));
    }
  }

  void signUpScreen() {
    // Modular.to.pushNamed('/register');
    Navigator.of(context).pushNamed(RoutersConst.register);
  }

  @action
  Future loginWithFace() async {
    try {
      loading = true;
      await auth.loginWithFacebook();
     } on Exception catch (e) {
      loading = false;
      print(e);
    }
  }
}

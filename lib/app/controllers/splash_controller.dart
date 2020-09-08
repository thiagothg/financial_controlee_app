import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../core/consts/routers_const.dart';
import '../core/enums/app_enums.dart';
import '../shared/auth/auth_controller.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final auth = Modular.get<AuthController>();

  Future<void> verifyUserloggedIn() async {
    await Future.delayed(Duration(seconds: 3));
    if (auth.status == AuthStatus.login) {
      Modular.to.pushReplacementNamed(RoutersConst.home);
    } else if (auth.status == AuthStatus.logoff) {
      Modular.to.pushReplacementNamed(RoutersConst.login);
    }

  } 
}

import 'controllers/year/goals_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'controllers/splash_controller.dart';
import 'core/consts/routers_const.dart';
import 'core/interface/shared_repository_interface.dart';
import 'core/repositories/local_storage_hive.dart';
import 'core/repositories/shared_repository.dart';
import 'modules/home_module.dart';
import 'modules/login_module.dart';
import 'modules/sign_up_module.dart';
import 'modules/splash_module.dart';
import 'modules/welcome_module.dart';
import 'repositories/firebase_repository_base.dart';
import 'repositories/user_repository.dart';
import 'shared/auth/auth_controller.dart';
import 'shared/auth/repositories/auth_repository.dart';
import 'shared/auth/repositories/auth_repository_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => GoalsController()),
        Bind((i) => AppController()),
        Bind<ISharedRepositoryInterface>(
          (i) => SharedRepository(),
        ),
        Bind((i) => SplashController()),
        Bind((i) => LocalStorafeHive()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
        Bind<FirebaseRepositoyBase>((i) => UserRepository())
      ];

  @override
  List<Router> get routers => [
        Router(RoutersConst.splash, module: SplashModule()),
        Router(RoutersConst.login,
            module: LoginModule(), transition: TransitionType.noTransition),
        Router(RoutersConst.home, module: HomeModule()),
        Router(RoutersConst.register, module: SignUpModule()),
        Router(RoutersConst.welcome, module: WelcomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

import 'package:financialcontroleeapp/app/modules/splash_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'controllers/splash_controller.dart';
import 'controllers/year/create_goals_controller.dart';
import 'controllers/year/goals_controller.dart';
import 'core/consts/app_conts.dart';
import 'core/consts/routers_const.dart';
import 'core/interface/shared_repository_interface.dart';
import 'core/repositories/local_storage_hive.dart';
import 'core/repositories/shared_repository.dart';
import 'interfaces/todo_repository_interface.dart';
import 'modules/home_module.dart';
import 'modules/login_module.dart';
import 'modules/sign_up_module.dart';
import 'modules/todo_module.dart';
import 'modules/welcome_module.dart';
import 'repositories/firebase_repository_base.dart';
import 'repositories/todo_repository.dart';
import 'repositories/user_repository.dart';
import 'shared/auth/auth_controller.dart';
import 'shared/auth/repositories/auth_repository.dart';
import 'shared/auth/repositories/auth_repository_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [

    Bind((i) => CreateGoalsController()),
    Bind((i) => GoalsController()),
    Bind((i) => AppController()),
    Bind<ISharedRepositoryInterface>(
      (i) => SharedRepository(),
    ),
    Bind((i) => SplashController()),
    Bind((i) => LocalStorafeHive()),
    Bind<IAuthRepository>((i) => AuthRepository()),
    Bind((i) => AuthController()),
    Bind<FirebaseRepositoyBase>((i) => UserRepository()),
    Bind<ITodoRepositoryInterface>((i) => TodoHasuraRepository(i.get())),
    Bind((i) => HasuraConnect(HasuraConfig.hasuraUrl)),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(RoutersConst.splash, module: SplashModule()),
    ModularRouter(RoutersConst.login,
        module: LoginModule(), transition: TransitionType.noTransition),
    ModularRouter(RoutersConst.home, module: HomeModule()),
    ModularRouter(RoutersConst.register, module: SignUpModule()),
    ModularRouter(RoutersConst.welcome, module: WelcomeModule()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}

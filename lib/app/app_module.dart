import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:shared_preferences_cache_interceptor/shared_preferences_cache_interceptor.dart';

import 'app_controller.dart';
import 'controllers/home_controller.dart';
import 'controllers/splash_controller.dart';
import 'controllers/year/goals_controller.dart';
import 'core/consts/app_conts.dart';
import 'core/consts/routers_const.dart';
import 'core/repositories/local_storage_hive.dart';
import 'core/repositories/shared_repository.dart';
import 'modules/debts/debts_module.dart';
import 'modules/home_module.dart';
import 'modules/login_module.dart';
import 'modules/settings/settings_module.dart';
import 'modules/sign_up_module.dart';
import 'modules/splash_module.dart';
import 'modules/welcome_module.dart';
import 'modules/year/year_goal_module.dart';
import 'repositories/todo_repository.dart';
import 'repositories/user_repository.dart';
import 'shared/auth/auth_controller.dart';
import 'shared/auth/repositories/auth_repository.dart';
import 'views/tabs/year_goal/pages/create_goals/create_goals_page.dart';

class AppModule extends Module {
  final cacheInterceptor = SharedPreferencesCacheInterceptor();

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AppController()),
        Bind.lazySingleton((i) => HomeController()),
        // Bind.lazySingleton((i) => CreateGoalsController()),
        Bind.lazySingleton((i) => GoalsController(i.get())),
        Bind.lazySingleton((i) => SplashController),
        Bind.lazySingleton((i) => AuthController()),
        Bind.singleton((i) => SharedRepository()),
        Bind.singleton((i) => AuthRepository()),
        Bind.lazySingleton((i) => LocalStorafeHive()),
        Bind.singleton((i) => UserRepository(i.get())),
        Bind.lazySingleton((i) => HasuraConnect(HasuraConfig.hasuraUrl,
            interceptors: [cacheInterceptor],
            // reconnectionAttemp: 3,
            headers: {'hasura_key_admin': 'ga0RGNYHvNM5d0SLGQfpQWAPGJ8='})),
        Bind.singleton((i) => TodoHasuraRepository(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(RoutersConst.splash, module: SplashModule()),
        ModuleRoute(RoutersConst.login,
            module: LoginModule(), transition: TransitionType.noTransition),
        ModuleRoute(RoutersConst.register, module: SignUpModule()),
        ModuleRoute(RoutersConst.welcome, module: WelcomeModule()),

        //Drawer
        ModuleRoute(RoutersConst.home, module: HomeModule()),
        ModuleRoute(RoutersConst.year, module: YearGoalModule()),
        ModuleRoute(RoutersConst.debts, module: DebtsModule()),
        ModuleRoute(RoutersConst.settings, module: SettingsModule()),


        ChildRoute('/${RoutersConst.goalsCreate}',
            duration: Duration(milliseconds: 400),
            child: (_, args) => CreateGoalsPage(),
            transition: TransitionType.downToUp),
      ];
}

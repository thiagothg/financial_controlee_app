import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/dashboard_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/year/year_goal_controller.dart';
import '../core/consts/routers_const.dart';
import '../views/home/home_page.dart';
import 'dashboard_module.dart';
import 'year/year_goal_module.dart';


class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController()),
    Bind((i) => DashboardController()),
    Bind((i) => YearGoalController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, 
      child: (_, args) => HomePage(),
      children: [
        ModuleRoute(RoutersConst.dashboard, module: DashboardModule()),
        ModuleRoute(RoutersConst.year, module: YearGoalModule()),
        ModuleRoute(RoutersConst.goals, module: YearGoalModule()),
      ]  
    ),

  ];

  // static Inject get to => Inject<HomeModule>.of();
}

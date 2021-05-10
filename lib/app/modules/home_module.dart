import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/dashboard_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/year/year_goal_controller.dart';
import '../core/consts/routers_const.dart';
import '../views/tabs/dashboard/dashboard_page.dart';
import 'dashboard_module.dart';


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
      child: (_, args) => DashboardPage(),
      children: [
        ModuleRoute(RoutersConst.dashboard, module: DashboardModule()),
      ]  
    ),

  ];

  // static Inject get to => Inject<HomeModule>.of();
}

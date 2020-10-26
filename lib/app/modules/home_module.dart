import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/dashboard_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/year/year_goal_controller.dart';
import '../core/consts/routers_const.dart';
import '../screens/home/home_page.dart';
import 'dashboard_module.dart';
import 'year/year_goal_module.dart';


class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController()),
    Bind((i) => DashboardController()),
    Bind((i) => YearGoalController()),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
    ModularRouter(RoutersConst.dashboard, module: DashboardModule()),
    ModularRouter(RoutersConst.year, module: YearGoalModule()),
    // ModularRouter(RoutersConst.goals, child: (_, args) => GoalsPage()),

  ];

  static Inject get to => Inject<HomeModule>.of();
}

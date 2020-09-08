import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/dashboard_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/year/goals_controller.dart';
import '../controllers/year_goal_controller.dart';
import '../core/consts/routers_const.dart';
import '../screens/home/home_page.dart';
import '../screens/tabs/dashboard/dashboard_page.dart';
import '../screens/tabs/year_goal/pages/goals/goals_page.dart';
import '../screens/tabs/year_goal/year_goal_page.dart';


class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => DashboardController()),
        Bind((i) => YearGoalController()),
        Bind((i) => GoalsController()),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(RoutersConst.home, child: (_, args) => HomePage()),
    ModularRouter(RoutersConst.dashboard, child: (_, args) => DashboardPage()),
    ModularRouter(RoutersConst.year, child: (_, args) => YearGoalPage()),
    ModularRouter(RoutersConst.goals, child: (_, args) => GoalsPage()),

  ];

  static Inject get to => Inject<HomeModule>.of();
}

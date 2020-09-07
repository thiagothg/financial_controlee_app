import 'package:financialcontroleeapp/app/controllers/dashboard_controller.dart';
import 'package:financialcontroleeapp/app/controllers/year_goal_controller.dart';
import 'package:financialcontroleeapp/app/screens/tabs/dashboard/dashboard_page.dart';
import 'package:financialcontroleeapp/app/controllers/year/goals_controller.dart';
import 'package:financialcontroleeapp/app/screens/tabs/year_goal/pages/goals/goals_page.dart';
import 'package:financialcontroleeapp/app/screens/tabs/year_goal/year_goal_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/home_controller.dart';
import '../core/consts/routers_const.dart';
import '../screens/home/home_page.dart';


class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => DashboardController()),
        Bind((i) => YearGoalController()),
        Bind((i) => GoalsController()),
      ];

  @override
  List<Router> get routers => [
    Router(RoutersConst.home, child: (_, args) => HomePage()),
    Router(RoutersConst.dashboard, child: (_, args) => DashboardPage()),
    Router(RoutersConst.year, child: (_, args) => YearGoalPage()),
    Router(RoutersConst.goals, child: (_, args) => GoalsPage()),

  ];

  static Inject get to => Inject<HomeModule>.of();
}

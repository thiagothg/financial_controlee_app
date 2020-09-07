import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/year_goal_controller.dart';
import '../screens/tabs/year_goal/year_goal_page.dart';

class YearGoalModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => YearGoalController()),
      ];

  static Inject get to => Inject<YearGoalModule>.of();

  @override
  Widget get view => YearGoalPage();
}

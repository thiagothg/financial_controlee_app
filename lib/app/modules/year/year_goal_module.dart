import 'package:flutter_modular/flutter_modular.dart';

import '../../controllers/year/create_goals_controller.dart';
import '../../controllers/year/goal_detail_controller.dart';
import '../../controllers/year/year_goal_controller.dart';
import '../../core/consts/routers_const.dart';
import '../../interfaces/goal_repository_interface.dart';
import '../../repositories/goal_repository.dart';
import '../../screens/tabs/year_goal/pages/config_goal_page.dart';
import '../../screens/tabs/year_goal/pages/create_goals/create_goals_page.dart';
import '../../screens/tabs/year_goal/pages/goal_detail/goal_detail_page.dart';
import '../../screens/tabs/year_goal/year_goal_page.dart';

class YearGoalModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => YearGoalController()),
    Bind((i) => CreateGoalsController()),
    Bind((i) => GoalDetailController()),
    Bind<IGoalRepositoryInterface>((i) => GoalRepository()),

  ];

  static Inject get to => Inject<YearGoalModule>.of();

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => YearGoalPage()),
    ModularRouter('/second', child: (_, args) => ConfigGoalPage()),

    ModularRouter(RoutersConst.goalsCreate,
      duration: Duration(milliseconds: 400),
      child: (_, args) => CreateGoalsPage(),
      transition: TransitionType.downToUp
    ),
    
    ModularRouter(RoutersConst.goalDetail,
      duration: Duration(milliseconds: 400),
      child: (_, args) => GoalDetailPage(
        model: args.data,
      ),
      transition: TransitionType.downToUp
    ),
  ];

}

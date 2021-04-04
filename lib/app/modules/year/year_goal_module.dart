import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../controllers/year/year_goal_controller.dart';
import '../../repositories/goal_repository.dart';
import '../../views/tabs/year_goal/pages/about/about_page.dart';
import '../../views/tabs/year_goal/pages/config_goal_page.dart';
import '../../views/tabs/year_goal/pages/goal_detail/goal_detail_page.dart';
import '../../views/tabs/year_goal/pages/goals/goals_page.dart';
import '../../views/tabs/year_goal/year_goal_page.dart';

class YearGoalModule extends Module {
  @override
  List<Bind> get binds => [
    // Bind.factory((i) => CreateGoalsController()),
    Bind.lazySingleton((i) => YearGoalController()),

    // Bind.lazySingleton((i) => GoalDetailController()),
    Bind.lazySingleton((i) => GoalRepository(i.get<HasuraConnect>())),
    

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', 
      child: (_, args) => YearGoalPage(),
      children: [
        ChildRoute('/goal', child: (_, __) => GoalsPage()),
        ChildRoute('/about', child: (_, __) => AboutPage()),

        
        ChildRoute('/second', child: (_, args) => ConfigGoalPage()),
        
        ChildRoute('/goal-detail',
          duration: Duration(milliseconds: 400),
          child: (_, args) => GoalDetailPage(
            model: args.data,
          ),
          transition: TransitionType.downToUp
        ),

        // WildcardRoute(child: (_, args) => UnknownPage()),
      ]
    ),
  ];

}

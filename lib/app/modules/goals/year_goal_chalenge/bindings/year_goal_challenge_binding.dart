import '../../../../data/repository/goals/year_goal_challenge_respository.dart';
import 'package:get/get.dart';

import '../controllers/year_goal_challenge_controller.dart';

class YearGoalChalengeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YearGoalChallengeController>(
      () => YearGoalChallengeController(),
    );

    Get.lazyPut<YearGoalChallangeRepository>(
      () => YearGoalChallangeRepository(),
    );
  }
}

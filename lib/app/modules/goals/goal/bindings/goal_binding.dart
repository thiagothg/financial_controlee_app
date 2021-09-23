import 'package:get/get.dart';

import '../controllers/goal_controller.dart';

class GoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoalController>(
      () => GoalController(),
    );
  }
}

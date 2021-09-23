import 'package:financial_controlee_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/debts_controller.dart';

class DebtsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebtsController>(
      () => DebtsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

import 'package:financial_controlee_app/app/data/repository/goals/year_goal_challenge_respository.dart';
import 'package:financial_controlee_app/app/global/controllers/auth_controller.dart';
import 'package:financial_controlee_app/app/global/utils/helpers/language_helper.dart';
import 'package:financial_controlee_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GoalController extends GetxController {
  //Essential
  // final goalRepository = Get.find<GoalRepository>();
  final auth = Get.find<AuthController>();

  // RxList<GoalModel> listGoals = <GoalModel>[].obs;
  RxBool isLoading = true.obs;
  // Rx<GoalModel?> goalModel = Rx(null);
  //Form
  final formKey = GlobalKey<FormState>();
  final nameGoalController = TextEditingController();
  final qtdGoalController = TextEditingController();
  final dateGoalController =
      TextEditingController(text: DateFormat.yMd().format(DateTime.now()));

  Rx<DateTime> dateGoal = DateTime.now().obs;

  @override
  void onInit() {
    print('onInit GoalController');
    loadData();
    super.onInit();
  }

  @override
  void onReady() {
    print('oonReadyn');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose');
  }

  void loadData() async {
    try {
      isLoading(true);
      // print(auth.user.value?.user.id);
      // await goalRepository
      //     .getGoals(auth.user.value!.user.id)
      //     .then((val) => listGoals.assignAll(val));
      // update();
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> selectDate(BuildContext context) async {
    var locale = L10n.getCurrentLocale();

    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: dateGoal.value,
      lastDate: DateTime.now().add(Duration(days: 365 * 20)),
      locale: locale,
    );

    if (picked != null && picked != dateGoal.value) {
      dateGoal = picked.obs;
      dateGoalController.value =
          TextEditingValue(text: DateFormat.yMd().format(picked));
    }
  }

  Future<void> createGoal() async {}

  Future<void> goToPreviewView() async {
    if (formKey.currentState!.validate()) {
      try {
        EasyLoading.show(
            status: 'loading...', maskType: EasyLoadingMaskType.black);

        await createGoal();
        EasyLoading.dismiss();

        Get.toNamed(Routes.GOAL_PREVIEW);
      } catch (e) {
        EasyLoading.dismiss();
      }
    }
  }
}

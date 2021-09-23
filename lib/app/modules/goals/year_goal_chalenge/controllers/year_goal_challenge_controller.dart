import 'package:financial_controlee_app/app/data/model/goals/year_goal_challenge_model.dart';
import 'package:financial_controlee_app/app/data/model/goals/year_goal_challenge_week_model.dart';
import 'package:financial_controlee_app/app/data/repository/goals/year_goal_challenge_respository.dart';
import 'package:financial_controlee_app/app/global/controllers/auth_controller.dart';
import 'package:financial_controlee_app/app/global/utils/helpers/language_helper.dart';
import 'package:financial_controlee_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class YearGoalChallengeController extends GetxController with StateMixin {
  //Essential
  final goalRepository = Get.find<YearGoalChallangeRepository>();
  final auth = Get.find<AuthController>();

  RxList<YearGoalChallenge> listGoals = <YearGoalChallenge>[].obs;
  RxBool isLoading = true.obs;
  Rx<YearGoalChallenge?> goalModel = Rx(null);
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

  void onRefresh() {
    change([], status: RxStatus.loading());
    loadData();
  }

  void loadData() async {
    await goalRepository.getGoals(auth.user.value!.user.id).then((val) {
      listGoals.assignAll(val);
      if (val.isNotEmpty) {
        change(val, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error('Houve um erro na requisição.'));
    });
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

  Future<void> saveGoal() async {
    try {
      // goalRepository.sa

    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> createGoal() async {
    var dateEnd = dateGoal.value.add(Duration(days: 365));
    var m = qtdGoalController.text
        .replaceAll(L10n.getCurrency().currencySymbol, '');
    var moneyStart = double.tryParse(m)!;

    var moneyEnd = moneyStart * 52;
    var total = 0.0;
    var weeks = List<YearGoalChallengeWeek>.generate(52, (i) {
      total = (moneyStart + (moneyStart * i)) + total;
      return YearGoalChallengeWeek(
          date: dateGoal.value.add(Duration(days: 7 * i)),
          money: moneyStart + (moneyStart * i),
          saved: false,
          title: 'Week $i',
          week: i);
    });

    goalModel = YearGoalChallenge(
            title: nameGoalController.text,
            qtdSaved: 0,
            moneyStart: moneyStart,
            dateStart: dateGoal.value,
            userUid: auth.user.value!.user.id,
            progress: 0,
            dateEnd: dateEnd,
            moneyEnd: moneyEnd,
            total: total,
            weeksGoal: weeks)
        .obs;
  }

  Future<void> goToPreviewView() async {
    if (formKey.currentState!.validate()) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      try {
        EasyLoading.show(
            status: 'loading...', maskType: EasyLoadingMaskType.black);

        await createGoal();
        EasyLoading.dismiss();

        Get.toNamed(Routes.YEAR_GOAL_CHALLENGE_PREVIEW);
      } catch (e) {
        EasyLoading.dismiss();
      }
    }
  }
}

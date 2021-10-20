import '../../../../data/model/goals/year_goal_challenge_model.dart';
import '../../../../data/model/goals/year_goal_challenge_week_model.dart';
import '../../../../data/repository/goals/year_goal_challenge_respository.dart';
import '../../../../global/services/auth_service.dart';
import '../../../../global/utils/components/snackbars/error_snackbar.dart';
import '../../../../global/utils/helpers/language_helper.dart';
import '../../../../global/utils/utils.dart';
import '../../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class YearGoalChallengeController extends GetxController with StateMixin {
  //Essential
  final goalRepository = Get.find<YearGoalChallangeRepository>();
  final auth = Get.find<AuthService>();

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
  RxDouble progress = 0.0.obs;
  RxDouble qtdGoal = 0.0.obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void onClose() {}

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

  Future<void> save() async {
    try {
      EasyLoading.show(
          status: 'saving...', maskType: EasyLoadingMaskType.black);

      await goalRepository.save(goalModel.value!);
      await Future.delayed(Duration(seconds: 1));

      EasyLoading.dismiss();
      await EasyLoading.showSuccess('Success');
      Get.offNamedUntil(Routes.YEAR_GOAL_CHALLENGE, (route) => false);
      // Get.defaultDialog(
      //   title: 'Goal saved with su'
      // );

    } catch (e) {
      Utils.safePrint(e.toString());
      EasyLoading.dismiss();
      EasyLoading.showError('erro');
    }
  }

  Future<void> delete(String id) async {
    try {
      EasyLoading.show(
          status: 'deleting...', maskType: EasyLoadingMaskType.black);

      await goalRepository.delete(id);
      await Future.delayed(Duration(seconds: 1));
      listGoals.removeWhere((e) => e.id == id);
      change(listGoals, status: RxStatus.loadingMore());

      EasyLoading.dismiss();
      await EasyLoading.showSuccess('Success');
      if (listGoals.isEmpty) {
        change(null, status: RxStatus.empty());
      }
      // Get.offNamedUntil(Routes.YEAR_GOAL_CHALLENGE, (route) => false);
    } catch (e) {
      Utils.safePrint(e.toString());
      EasyLoading.dismiss();
      EasyLoading.showError('erro');
    }
  }

  Future<void> createGoal() async {
    var dateEnd = dateGoal.value.add(Duration(days: 365));
    var m = qtdGoalController.text
        .replaceAll(L10n.getCurrency().currencySymbol, '')
        .trim()
        .replaceAll(',', '.');

    var moneyStart = double.tryParse(m)!;

    var moneyEnd = moneyStart * 52;
    var total = 0.0;
    var weeks = List<YearGoalChallengeWeek>.generate(52, (i) {
      total = (moneyStart + (moneyStart * i)) + total;
      return YearGoalChallengeWeek(
          id: '',
          date: dateGoal.value.add(Duration(days: 7 * i)),
          money: moneyStart + (moneyStart * i),
          saved: false,
          title: '${i + 1}',
          week: i);
    });

    goalModel = YearGoalChallenge(
            id: '',
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
        Utils.safePrint(e.toString());
        EasyLoading.dismiss();
        SnackBars(
          message: '',
          title: 'Error',
        ).errorSnackbar();
      }
    }
  }

  Future<void> toggle(
      YearGoalChallengeWeek item, bool taggle, int index) async {
    var progress = ((100 * item.money) / goalModel.value!.total);
    if (taggle) {
      goalModel.value!.qtdSaved += item.money;
      goalModel.value!.progress += progress;
    } else {
      goalModel.value!.qtdSaved -= item.money;
      goalModel.value!.progress -= progress;
    }

    goalModel.value!.weeksGoal![index].saved = taggle;
    await goalRepository.updateGoalAndWeek(
        goalModel.value!, goalModel.value!.weeksGoal![index]);
    update();
  }
}

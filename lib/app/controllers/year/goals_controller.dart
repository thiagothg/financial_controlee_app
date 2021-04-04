import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../core/consts/app_conts.dart';
import '../../interfaces/goal_repository_interface.dart';
import '../../models/goal_model.dart';
import '../../models/goal_week_model.dart';
import '../../shared/auth/auth_controller.dart';

part 'goals_controller.g.dart';

class GoalsController = _GoalsControllerBase with _$GoalsController;

abstract class _GoalsControllerBase with Store implements Disposable  {
  final IGoalRepositoryInterface goalRepository;
  final AuthController auth = Modular.get();

  _GoalsControllerBase(this.goalRepository) {
    getGoals();
  }

  TextEditingController nameGoalController = TextEditingController();
  TextEditingController qtdGoalController = TextEditingController();
  TextEditingController dateGoalController = TextEditingController();

  final formKey = GlobalKey<FormState>(debugLabel: 'form_year_goal');

  @observable
  double qtdGoal = 0.0;

  @observable
  DateTime dateGoal = DateTime.now();

  @computed
  bool get isDateValid => dateGoal.isAfter(DateTime.now());

  @computed
  VoidCallback? get buttonPressed =>
      (isDateValid && !loading) ? save : null;

  @observable
  bool loading = false;

  @observable
  ObservableList<GoalWeek>? _goals;

  @observable
  int _progress = 0;

  @computed
  int get getProgress => _progress;

  @computed
  ObservableList<GoalWeek>? get goalsWeeks => _goals;

  @observable
  ObservableStream<List<GoalModel>>? stream;
  
  void getGoals() async {
    stream = goalRepository.getGoals(auth.userModel.id!).asObservable();
    print('teste');
  }

  Future<void> setQtdGoal(String value) async {
    var regExp = RegExp(r"[a-zA-Z]");
    var p = double.tryParse(
      value
      .replaceAll(regExp, '')
      .replaceAll(',', '')
      .replaceAll('.', '').trim());
    if(p != null) {
      qtdGoal = p / 100;
    }
  }

  @action
  Future<void> save() async {
    if (formKey.currentState!.validate()) {
      loading = true;
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black
      );
      
      var dateEnd = dateGoal.add(Duration(days: 365));
      var weeks = (dateEnd.difference(dateGoal).inDays ~/ 7);

      var model =  GoalModel(
        title: nameGoalController.text,
        moneyStart: qtdGoal,
        qtdSaved: 0,
        dateStart: dateGoal,
        progress: 0,
        userUid: auth.userModel.documentId(),
        dateEnd: dateEnd,
        moneyEnd: qtdGoal * weeks,
        weeksGoal: []
      );
      model.setCreateTime();
      model.enableDocument();

      for (var i = 1; i <= weeks; i++) {
        var week = i * 7;
        var money = model.moneyStart * i;
        var weekModal = GoalWeek(
          saved: false,
          title: '$i',
          money: money,
          week: i,
          date: dateGoal.add(Duration(days: week))
        );
        model.weeksGoal?.add(weekModal);
      }

      var result = await goalRepository.createGoal(model);
     
      await Future.delayed(Duration(seconds: 1));
      EasyLoading.dismiss();
      loading = false;   
      if(result.success) {
        Fluttertoast.showToast(
          msg: "Goal create succssely",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green.shade800,
          textColor: Colors.white,
          fontSize: 16.0
        );

        Modular.to.maybePop();
      } else {
        print(result.message);
        Fluttertoast.showToast(
          msg: "ocorreu um erro",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
        );
      }
    }
  }

  
  Future<Null> selectDate(BuildContext context) async {
    var locale = L10n.getCurrentLocale();

    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: dateGoal,
      lastDate: DateTime(2100),
      locale: locale,
    );

    if (picked != null && picked != dateGoal) {
      dateGoal = picked;
      dateGoalController.value = TextEditingValue(
        text: DateFormat.yMd().format(picked)
      );
    }
  }

  @action
  Future<void> updateWeek(GoalWeek goalWeek, GoalModel goalModel, int i) async {
    var por = 2;
    var progressWeek = 0;
    if(goalWeek.saved) {
      progressWeek = goalModel.progress + por;
      goalModel.progress = _progress;

      var qtdSaved = goalModel.qtdSaved + goalWeek.money;
      goalModel.qtdSaved =  qtdSaved;
    } else {
      progressWeek = goalModel.progress - por;
      goalModel.progress = _progress;

      var qtdSaved = goalModel.qtdSaved - goalWeek.money;
      goalModel.qtdSaved = qtdSaved;
    }
    _progress = progressWeek;
    _goals?[i].saved = goalWeek.saved;
    await goalRepository.updateWeek(goalWeek, goalModel);
  }

  void dispose() {
    formKey.currentState?.dispose();
  }

  @action 
  Future<void> setProgreess(int val) async => _progress = val;

  @action 
  Future<void> setGoalWeeks(List<GoalWeek> val) async 
    => _goals =  val.asObservable();
  
}

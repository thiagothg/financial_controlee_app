// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoalsController on _GoalsControllerBase, Store {
  Computed<bool>? _$isDateValidComputed;

  @override
  bool get isDateValid =>
      (_$isDateValidComputed ??= Computed<bool>(() => super.isDateValid,
              name: '_GoalsControllerBase.isDateValid'))
          .value;
  Computed<VoidCallback?>? _$buttonPressedComputed;

  @override
  VoidCallback? get buttonPressed => (_$buttonPressedComputed ??=
          Computed<VoidCallback?>(() => super.buttonPressed,
              name: '_GoalsControllerBase.buttonPressed'))
      .value;
  Computed<int>? _$getProgressComputed;

  @override
  int get getProgress =>
      (_$getProgressComputed ??= Computed<int>(() => super.getProgress,
              name: '_GoalsControllerBase.getProgress'))
          .value;
  Computed<ObservableList<GoalWeek>>? _$goalsWeeksComputed;

  @override
  ObservableList<GoalWeek> get goalsWeeks => (_$goalsWeeksComputed ??=
          Computed<ObservableList<GoalWeek>>(() => super.goalsWeeks,
              name: '_GoalsControllerBase.goalsWeeks'))
      .value;

  final _$qtdGoalAtom = Atom(name: '_GoalsControllerBase.qtdGoal');

  @override
  double get qtdGoal {
    _$qtdGoalAtom.reportRead();
    return super.qtdGoal;
  }

  @override
  set qtdGoal(double value) {
    _$qtdGoalAtom.reportWrite(value, super.qtdGoal, () {
      super.qtdGoal = value;
    });
  }

  final _$dateGoalAtom = Atom(name: '_GoalsControllerBase.dateGoal');

  @override
  DateTime get dateGoal {
    _$dateGoalAtom.reportRead();
    return super.dateGoal;
  }

  @override
  set dateGoal(DateTime value) {
    _$dateGoalAtom.reportWrite(value, super.dateGoal, () {
      super.dateGoal = value;
    });
  }

  final _$loadingAtom = Atom(name: '_GoalsControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_goalsAtom = Atom(name: '_GoalsControllerBase._goals');

  @override
  ObservableList<GoalWeek> get _goals {
    _$_goalsAtom.reportRead();
    return super._goals;
  }

  @override
  set _goals(ObservableList<GoalWeek> value) {
    _$_goalsAtom.reportWrite(value, super._goals, () {
      super._goals = value;
    });
  }

  final _$_progressAtom = Atom(name: '_GoalsControllerBase._progress');

  @override
  int get _progress {
    _$_progressAtom.reportRead();
    return super._progress;
  }

  @override
  set _progress(int value) {
    _$_progressAtom.reportWrite(value, super._progress, () {
      super._progress = value;
    });
  }

  final _$saveAsyncAction = AsyncAction('_GoalsControllerBase.save');

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$updateWeekAsyncAction =
      AsyncAction('_GoalsControllerBase.updateWeek');

  @override
  Future<void> updateWeek(GoalWeek goalWeek, GoalModel goalModel, int i) {
    return _$updateWeekAsyncAction
        .run(() => super.updateWeek(goalWeek, goalModel, i));
  }

  final _$setProgreessAsyncAction =
      AsyncAction('_GoalsControllerBase.setProgreess');

  @override
  Future<void> setProgreess(int val) {
    return _$setProgreessAsyncAction.run(() => super.setProgreess(val));
  }

  final _$setGoalWeeksAsyncAction =
      AsyncAction('_GoalsControllerBase.setGoalWeeks');

  @override
  Future<void> setGoalWeeks(List<GoalWeek> val) {
    return _$setGoalWeeksAsyncAction.run(() => super.setGoalWeeks(val));
  }

  final _$_GoalsControllerBaseActionController =
      ActionController(name: '_GoalsControllerBase');

  @override
  void toggleDone(int i) {
    final _$actionInfo = _$_GoalsControllerBaseActionController.startAction(
        name: '_GoalsControllerBase.toggleDone');
    try {
      return super.toggleDone(i);
    } finally {
      _$_GoalsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
qtdGoal: ${qtdGoal},
dateGoal: ${dateGoal},
loading: ${loading},
isDateValid: ${isDateValid},
buttonPressed: ${buttonPressed},
getProgress: ${getProgress},
goalsWeeks: ${goalsWeeks}
    ''';
  }
}

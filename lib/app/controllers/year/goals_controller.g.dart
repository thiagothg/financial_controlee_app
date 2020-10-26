// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoalsController on _GoalsControllerBase, Store {
  final _$goalsAtom = Atom(name: '_GoalsControllerBase.goals');

  @override
  Stream<List<GoalModel>> get goals {
    _$goalsAtom.reportRead();
    return super.goals;
  }

  @override
  set goals(Stream<List<GoalModel>> value) {
    _$goalsAtom.reportWrite(value, super.goals, () {
      super.goals = value;
    });
  }

  final _$getGoalsAsyncAction = AsyncAction('_GoalsControllerBase.getGoals');

  @override
  Future<void> getGoals() {
    return _$getGoalsAsyncAction.run(() => super.getGoals());
  }

  @override
  String toString() {
    return '''
goals: ${goals}
    ''';
  }
}

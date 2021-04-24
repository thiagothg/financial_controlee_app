// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year_goal_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$YearGoalController on _YearGoalControllerBase, Store {
  Computed<int>? _$getSelectedIndexComputed;

  @override
  int get getSelectedIndex => (_$getSelectedIndexComputed ??= Computed<int>(
          () => super.getSelectedIndex,
          name: '_YearGoalControllerBase.getSelectedIndex'))
      .value;

  final _$_selectedIndexAtom =
      Atom(name: '_YearGoalControllerBase._selectedIndex');

  @override
  int get _selectedIndex {
    _$_selectedIndexAtom.reportRead();
    return super._selectedIndex;
  }

  @override
  set _selectedIndex(int value) {
    _$_selectedIndexAtom.reportWrite(value, super._selectedIndex, () {
      super._selectedIndex = value;
    });
  }

  final _$_YearGoalControllerBaseActionController =
      ActionController(name: '_YearGoalControllerBase');

  @override
  void setSelectIndex(int index) {
    final _$actionInfo = _$_YearGoalControllerBaseActionController.startAction(
        name: '_YearGoalControllerBase.setSelectIndex');
    try {
      return super.setSelectIndex(index);
    } finally {
      _$_YearGoalControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getSelectedIndex: ${getSelectedIndex}
    ''';
  }
}

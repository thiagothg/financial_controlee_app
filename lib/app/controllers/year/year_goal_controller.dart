import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'year_goal_controller.g.dart';

class YearGoalController = _YearGoalControllerBase with _$YearGoalController;

abstract class _YearGoalControllerBase with Store implements Disposable {
  
  final  pageController = PageController();

  void dispose() {
    // pageController.dispose();
  }

  @observable
  int _selectedIndex = 0;

  @computed
  int get getSelectedIndex => _selectedIndex;
  
  @action
  void setSelectIndex(int index) {
    if(Modular.to.path == '/home/year/goal') {
      _selectedIndex = 0;
    } else if (Modular.to.path == '/home/year/about') {
      _selectedIndex = 1;
    } else {
      _selectedIndex = 0;
    }
  }
}

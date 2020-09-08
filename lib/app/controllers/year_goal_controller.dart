import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'year_goal_controller.g.dart';

class YearGoalController = _YearGoalControllerBase with _$YearGoalController;

abstract class _YearGoalControllerBase with Store {
  
  final  pageController = PageController();

  void dispose() {
    pageController.dispose();
  }
  
}

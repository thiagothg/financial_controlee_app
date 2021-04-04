import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'year_goal_controller.g.dart';

class YearGoalController = _YearGoalControllerBase with _$YearGoalController;

abstract class _YearGoalControllerBase with Store implements Disposable {
  
  final  pageController = PageController();

  void dispose() {
    pageController.dispose();
  }
  
}

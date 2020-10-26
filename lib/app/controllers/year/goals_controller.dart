import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../models/goal_model.dart';
import '../../repositories/goal_repository.dart';
import '../../shared/auth/auth_controller.dart';

part 'goals_controller.g.dart';

class GoalsController = _GoalsControllerBase with _$GoalsController;

abstract class _GoalsControllerBase with Store {
  final GoalRepository goalRepository = Modular.get();
  final AuthController auth = Modular.get();

  _GoalsControllerBase() {
    
    goalRepository
      .getGoals(auth.userModel.id)
      .then((val) {
        goals = val.object;
      });
  }


  @observable
  Stream<List<GoalModel>> goals;
  

  @action
  Future<void> getGoals() async {
    var result = await goalRepository.getGoals(auth.userModel.id);

    if(result.success) {
      goals = result.object;
    }
  }

}

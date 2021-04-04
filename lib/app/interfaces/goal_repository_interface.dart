import 'dart:async';

import '../core/responses/response_default.dart';
import '../models/goal_model.dart';
import '../models/goal_week_model.dart';

mixin IGoalRepositoryInterface {
  
  Stream<List<GoalModel>> getGoals(String userUid);
  
  Future<DefaultResponse> createGoal(GoalModel model);
  
  Future<DefaultResponse> updateWeek(GoalWeek goalWeek, GoalModel goalModel);

  void disposeConnection();
}
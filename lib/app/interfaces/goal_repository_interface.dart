import 'dart:async';

import '../models/goal_model.dart';

mixin IGoalRepositoryInterface {
  
  Stream<List<GoalModel>> getGoals(String userUid);
  



}
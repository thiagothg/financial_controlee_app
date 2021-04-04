import 'dart:async';

import '../core/responses/response_default.dart';
import '../models/goal_model.dart';
import '../models/user_model.dart';

mixin IUserRepositoryInterface {
  
  Future<bool> exists(String id) ;
  Future<void> create(UserModel model);
  Future<DefaultResponse> update(GoalModel model);
  Future<DefaultResponse> get(String id);

  


}
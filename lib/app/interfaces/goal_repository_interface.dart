import 'dart:async';

import '../core/responses/response_default.dart';

mixin IGoalRepositoryInterface {
  
  Future<DefaultResponse> getGoals(String userUid);
  



}
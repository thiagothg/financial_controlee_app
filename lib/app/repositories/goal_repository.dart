import 'dart:async';

import 'package:hasura_connect/hasura_connect.dart';

import '../interfaces/goal_repository_interface.dart';
import '../models/goal_model.dart';
import '../models/goal_week_model.dart';
import 'documents/goal_doc.dart';

class GoalRepository with IGoalRepositoryInterface {
  
  final HasuraConnect connect;

  GoalRepository(this.connect);
  
  String get collection => 'yearGoals';
  String get collectionUser => 'users';
  String get collectionGoalWeeks => 'goalWeeks';

  @override
  Stream<List<GoalModel>> getGoals(String userUid) async* {
    var map = <String, dynamic>{};
    map['userId'] = userUid.trim();
    yield* await connect.subscription(userGoalsQuery, 
      variables: map)
      .map((event) {
        return (event['data']['control_app_TB_YEAR_GOALS'] as List)
          .map((e) {
            var goal = GoalModel.fromMap(e);
            var list = groupsToPairs(e['TB_YEAR_GOAL_WEEKs'] as List);

            goal.weeksGoal.addAll(list);
            return goal;
        }).toList();
      });
  }

  List<GoalWeek> groupsToPairs(List list) {
    return list.map((e) {
      return GoalWeek.fromMap(e);
    }).toList();
  }
}
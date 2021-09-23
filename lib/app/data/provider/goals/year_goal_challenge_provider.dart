import 'package:financial_controlee_app/app/global/core/services/gql_client.dart';
import 'package:financial_controlee_app/app/global/documents/year_goal_challenge_doc.dart';
import 'package:flutter/material.dart';

class YearGoalChallageProvider {
  final GraphQLClient _graphQLClient;
  YearGoalChallageProvider(this._graphQLClient);

  String get collection => 'yearGoals';
  String get collectionUser => 'users';
  String get collectionGoalWeeks => 'goalWeeks';

  Future<List> getGoals(String uid) async {
    try {
      var map = <String, dynamic>{};
      map['userId'] = uid.trim();
      return await _graphQLClient.connect
          .query(yearGoalsQuery, variables: map, key: UniqueKey().toString())
          .then((res) => (res['data']['FINANCIAL_APP_TB_YEAR_GOALS'] as List));
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}

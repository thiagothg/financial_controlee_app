import 'package:financial_controlee_app/app/global/core/services/gql_client.dart';
import 'package:financial_controlee_app/app/global/documents/goals/year_goal_challenge_doc.dart';
import 'package:financial_controlee_app/app/global/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';

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
      Utils.safePrint(e.toString());
      rethrow;
    }
  }

  Future<bool> save(Map<String, dynamic> data) async {
    try {
      return await _graphQLClient.connect
          .mutation(insertYearGoalAndWeekMutation,
              variables: data, key: UniqueKey().toString())
          .then((res) {
        Utils.safePrint(
            'rows saved: ${res['data']['insert_FINANCIAL_APP_TB_YEAR_GOALS']['affected_rows']}');
        return true;
      });
    } on HasuraRequestError catch (err) {
      Utils.safePrint(
          'ERRO: ${err.request} - ${err.message} - ${err.extensions}');
      Utils.safePrint(err.toString());
      rethrow;
    } catch (e) {
      Utils.safePrint(e.toString());
      rethrow;
    }
  }

  Future<bool> delete(String id) async {
    try {
      return await _graphQLClient.connect
          .mutation(yearGoalDelete,
              variables: {'id': id}, key: UniqueKey().toString())
          .then((res) {
        Utils.safePrint(
            'delete: ${res['data']['delete_FINANCIAL_APP_TB_YEAR_GOALS_by_pk']['id']}');
        return true;
      });
    } on HasuraRequestError catch (err) {
      Utils.safePrint(
          'ERRO: ${err.request} - ${err.message} - ${err.extensions}');
      Utils.safePrint(err.toString());
      rethrow;
    } catch (e) {
      Utils.safePrint(e.toString());
      rethrow;
    }
  }

  Future<bool> updateGoalWeek(Map<String, dynamic> data) async {
    try {
      return await _graphQLClient.connect
          .mutation(yearGoalWeekUpdate,
              variables: data, key: UniqueKey().toString())
          .then((res) {
        Utils.safePrint(
            'delete: ${res['data']['update_FINANCIAL_APP_TB_YEAR_GOALS_by_pk']['id']}');
        return true;
      });
    } on HasuraRequestError catch (err) {
      Utils.safePrint(
          'ERRO: ${err.request} - ${err.message} - ${err.extensions}');
      Utils.safePrint(err.toString());
      rethrow;
    } catch (e) {
      Utils.safePrint(e.toString());
      rethrow;
    }
  }
}

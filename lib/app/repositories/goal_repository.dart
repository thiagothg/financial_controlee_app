import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../core/responses/response_builder.dart';
import '../core/responses/response_default.dart';
import '../interfaces/goal_repository_interface.dart';
import '../models/goal_model.dart';
import '../models/goal_week_model.dart';
import 'documents/goal_doc.dart';

// ignore: prefer_mixin
class GoalRepository extends Disposable implements IGoalRepositoryInterface {
  
  final HasuraConnect _connect;
  GoalRepository(this._connect);
  
  String get collection => 'yearGoals';
  String get collectionUser => 'users';
  String get collectionGoalWeeks => 'goalWeeks';

  @override
  Stream<List<GoalModel>> getGoals(String userUid) async* {
    var map = <String, dynamic>{};
    map['userId'] = userUid.trim();
    
    // yield* await _connect.query(yearGoalsQuery, 
    //   variables: map)
    //   .then((res) async {
    //     var list = <GoalModel>[];
        
    //     for (var item in res['data']['FINANCIAL_APP_TB_YEAR_GOALS']) {
    //       list.add(GoalModel.fromJson(item));
    //     }
    //     return list;
    //   }).asStream();
    // 
    var snapshot =  await _connect
      .subscription(yearGoalsSubscription, 
        variables: map,
        key: UniqueKey().toString()
      );

    yield* snapshot.asyncMap((res) {
      var list = <GoalModel>[];
      for (var item in res['data']['FINANCIAL_APP_TB_YEAR_GOALS']) {
        list.add(GoalModel.fromJson(item));
      }

      return list;
    });
  }

  // List<GoalWeek> groupsToPairs(List list) {
  //   return list.map((e) {
  //     return GoalWeek.fromMap(e);
  //   }).toList();
  // }

  @override
  Future<DefaultResponse> createGoal(GoalModel model) async {
     try {
      var map = model.toJson();
      var weeksJson = {'data': map['TB_YEAR_GOAL_WEEKs']};

      map.update('TB_YEAR_GOAL_WEEKs', (value) => weeksJson);

      var result = await _connect.mutation(yearGoalAndWeeksInsertQuery,
        variables: { 'object': map }).then<String>((res) async {
          return res['data']
            ['insert_FINANCIAL_APP_TB_YEAR_GOALS_one']['id'];
        }); //.catchError((onError) => throw(onError));

      return Future.value(
        ResponseBuilder.success<String>(object: result)
      );
    } on HasuraRequestError catch (errorHasura) {
      return Future.value(ResponseBuilder.failed(
        object: errorHasura, 
        message: errorHasura.toString()
      ));
    } on Exception catch (e) {
      return Future.value(
        ResponseBuilder.failed(object: e, message: e.toString())
      );
    }
  }

  @override
  Future<DefaultResponse> updateWeek(GoalWeek goalWeek, 
    GoalModel goalModel) async {
     try {  
      var map = {
        'object_goal_week': {
          'saved': goalWeek.saved
        }, 
        'id_goal_week': goalWeek.id,
        'object_goal': {
          'qtd_saved': goalModel.qtdSaved,
          'progress': goalModel.progress
        },
        'id_goal': goalModel.id
      };

      var result = await _connect.mutation(yearGoalWeekUpdateQuery,
        variables: map).then<String>((res) async {
          // print(res['data']);
          return res['data']
            ['update_FINANCIAL_APP_TB_YEAR_GOAL_WEEK_by_pk']['id'];
        }); //.catchError((onError) => throw(onError));

      return Future.value(
        ResponseBuilder.success<String>(object: result)
      );
    } on HasuraRequestError catch (errorHasura) {
      return Future.value(ResponseBuilder.failed(
        object: errorHasura, 
        message: errorHasura.toString()
      ));
    } on Exception catch (e) {
      return Future.value(
        ResponseBuilder.failed(object: e, message: e.toString())
      );
    }
  }

  @override
  void dispose() {
    print('dispose Repo extends');
    _connect.dispose();
  }

  @override
  void disposeConnection() {
    print('dispose repo ');
    _connect.dispose();
  }
}
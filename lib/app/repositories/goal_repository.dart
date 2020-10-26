import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/responses/response_builder.dart';
import '../core/responses/response_default.dart';
import '../interfaces/goal_repository_interface.dart';
import '../models/goal_model.dart';
import '../models/goal_week_model.dart';
import 'firebase_repository_base.dart';

class GoalRepository extends 
  FirebaseRepositoyBase<GoalModel> with IGoalRepositoryInterface {
  
  @override
  String get collection => 'yearGoals';
  String get collectionUser => 'users';
  String get collectionGoalWeeks => 'goalWeeks';


  @override
  GoalModel Function(DocumentSnapshot document) get fromMap
    => (document) => GoalModel.fromMap(document);


  @override
  Future<DefaultResponse> getGoals(String userUid) async {
    try {
        var list =  await firestore.collection(collectionUser)
          .doc(userUid)
          .collection(collection)
          .snapshots()
          .asyncMap((groupMap) => groupsToPairs(groupMap, userUid));

      return ResponseBuilder.success<Stream>(
          object: list);
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  Future<List<GoalModel>> groupsToPairs(QuerySnapshot groupDoc, 
    String id) async {
    return Future.wait(groupDoc.docs.map((doc) async {
      return await groupToPair(doc, id);
    }).toList());
  }

  Future<GoalModel> groupToPair(DocumentSnapshot doc, String id) async {
    var goal = fromMap(doc);

    return await firestore.collection(collectionUser)
      .doc(id)
      .collection(collection)
      .doc(goal.id)
      .collection(collectionGoalWeeks)
      .get()
      .then((val) {
        var weeks = val.docs.map<GoalWeek>((doc)  {
          return GoalWeek.fromMap(doc);
        }).toList();

        goal.weeksGoal = weeks;
        return goal;
      });
  }
}
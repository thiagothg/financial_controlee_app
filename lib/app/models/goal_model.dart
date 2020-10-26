import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'base_model.dart';
import 'goal_week_model.dart';

class GoalModel extends BaseModel {
  String title;
  double moneyStart;
  String userUid;
  double moneyEnd;
  Timestamp dateStart;
  Timestamp dateEnd;
  int progress;
  double qtdSaved;
  List<GoalWeek> weeksGoal = [];

  GoalModel({
    this.title, 
    this.moneyStart, 
    this.dateStart, 
    this.moneyEnd, 
    this.dateEnd,
    this.progress,
    this.qtdSaved,
    this.userUid,
    this.weeksGoal
  });

  GoalModel.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    title = document.data()["title"];
    moneyStart = document.data()["moneyStart"] + 0.0;
    moneyEnd = document.data()["moneyEnd"] + 0.0;
    dateStart = document.data()["dateStart"];
    dateEnd = document.data()["dateEnd"];
    progress = document.data()["progress"];
    qtdSaved = document.data()["qtdSaved"] + 0.0;

    userUid = document.data()["userUid"];
  }

  GoalModel.toModelFirebaseUser(User data) {
    // name = data.displayName;
    // photoUrl = data.photoUrl;
    // email = data.email;
    // id = data.uid; 
  }

  @override
  Map toMap() {
    var map = super.toMap();
    map['title'] = title;
    map['moneyStart'] = moneyStart;
    map['dateStart'] = dateStart;
    map['userUid'] = userUid;
    return map;
  }

  static List<GoalModel> list = [
    GoalModel(
      title: 'Viagem',
      moneyStart: 12.0,
      moneyEnd: 122.22,
      // dateStart: '22/01/2020',
      // dateEnd: '21/05/2020',
      progress: 20,
      qtdSaved: 50,
      weeksGoal: GoalWeek.list
    ),
    GoalModel(
      title: 'Viagem Tetse',
      moneyStart: 12.0,
      moneyEnd: 122.22,
      // dateStart: '22/01/2020',
      // dateEnd: '21/05/2020',
      progress: 55,
      qtdSaved: 50,
      weeksGoal: []
    ),
    GoalModel(
      title: 'Teste',
      moneyStart: 12.0,
      moneyEnd: 122.22,
      // dateStart: '22/01/2020',
      // dateEnd: '21/05/2020',
      progress: 50,
      qtdSaved: 50,
      weeksGoal: []
    ),
  ];
}
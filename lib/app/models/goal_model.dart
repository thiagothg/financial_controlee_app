import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money2/money2.dart';

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

  final Currency _currency = Currency.create('BRL', 2, 
    // symbol: r'R$',  
    // pattern: 'S 0,00',
  );

  GoalModel.fromMap(Map<String, dynamic> json) : super.fromMap(json) {
    title = json["title"];
    moneyStart = json["moneyStart"] + 0.0;
    moneyEnd = json["moneyEnd"] + 0.0;
    dateStart = Timestamp.fromDate(DateTime.parse(json["dateStart"]));
    dateEnd = Timestamp.fromDate(DateTime.parse(json["dateEnd"]));
    progress = json["progress"];
    qtdSaved = json["qtdSaved"] + 0.0;
    userUid = json["userId"];
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

  String getMoneyFormat(double qtd) {
    return Money.from(qtd, _currency).toString();
  }

  String getRemainWeeks() {
    var diff = dateEnd.toDate().difference(DateTime.now());
    return (diff.inDays ~/ 7).toString();
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
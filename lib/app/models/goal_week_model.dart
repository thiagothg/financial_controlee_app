import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money2/money2.dart';

import 'base_model.dart';

class GoalWeek extends BaseModel {
  int title;
  double money;
  Timestamp date;
  bool saved;

  GoalWeek({
    this.title, 
    this.money, 
    this.date, 
    this.saved,
  });

  final Currency _currency = Currency.create('BRL', 2, 
    // symbol: r'R$',  
    // pattern: 'S 0,00',
  );

  GoalWeek.fromMap(Map<String, dynamic> json) : super.fromMap(json) {
    title = json["week"];
    money = json["money"] + 0.0;
    date = Timestamp.fromDate(DateTime.parse(json["date"]));
    saved = json["saved"];
    // saved = document.data()["saved"];
  }

  GoalWeek.toModelFirebaseUser(User data) {
    // name = data.displayName;
    // photoUrl = data.photoUrl;
    // email = data.email;
    // id = data.uid; 
  }

  @override
  Map toMap() {
    var map = super.toMap();
    map['title'] = title;
    map['money'] = money;
    map['date'] = date;
    map['saved'] = saved;
    return map;
  }

  String getMoneyFormat(double qtd) {
    return Money.from(qtd, _currency).toString();
  }

  static List<GoalWeek> list = [
    GoalWeek(
      title: 1,
      money: 5,
      // date: '22/01/2020',
      saved: true,
    ),
    GoalWeek(
      title: 2,
      money: 10,
      // date: '01/02/2020',
      saved: false,
    ),
    GoalWeek(
      title: 3,
      money: 15,
      // date: '08/02/2020',
      saved: true,
    ),
  ];
}
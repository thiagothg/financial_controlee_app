import 'package:money2/money2.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';
import 'goal_week_model.dart';


part 'goal_model.g.dart';

@JsonSerializable(explicitToJson: true) //
class GoalModel  extends BaseModel {
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'money_start')
  double moneyStart;
  @JsonKey(name: 'user_id')
  String userUid;
  @JsonKey(name: 'money_end')
  double moneyEnd;
  @JsonKey(name: 'date_start')
  DateTime dateStart;
  @JsonKey(name: 'date_end')
  DateTime dateEnd;
  @JsonKey(name: 'progress')
  int progress;
  @JsonKey(name: 'qtd_saved')
  double qtdSaved;
  @JsonKey(name: 'TB_YEAR_GOAL_WEEKs')
  List<GoalWeek>? weeksGoal = [];

  GoalModel({
    required  this.title, 
    required this.moneyStart, 
    required this.dateStart, 
    required this.moneyEnd, 
    required this.dateEnd,
    required this.progress,
    required this.qtdSaved,
    required this.userUid,
    this.weeksGoal
  });

  final Currency _currency = Currency.create('BRL', 2, 
    // symbol: r'R$',  
    // pattern: 'S 0,00',
  );

  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoalModelToJson(this);


  // GoalModel.fromMap(Map<String, dynamic> json) : super.fromMap(json)  {
  //   title = json["title"];
  //   moneyStart = json["moneyStart"] + 0.0;
  //   moneyEnd = json["moneyEnd"] + 0.0;
  //   // dateStart = Timestamp.fromDate(DateTime.parse(json["dateStart"]));
  //   // dateEnd = Timestamp.fromDate(DateTime.parse(json["dateEnd"]));
  //   progress = json["progress"];
  //   qtdSaved = json["qtdSaved"] + 0.0;
  //   userUid = json["userId"];
  // }

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    // map['title'] = title;
    // map['moneyStart'] = moneyStart;
    // map['dateStart'] = dateStart;
    // map['userUid'] = userUid;
    return map;
  }

  String getMoneyFormat(double qtd) {
    return Money.from(qtd, _currency).toString();
  }

  String getRemainWeeks() {
    var diff = dateEnd.difference(DateTime.now()).inDays;
   
    return (diff ~/ 7).toString();
  }
}
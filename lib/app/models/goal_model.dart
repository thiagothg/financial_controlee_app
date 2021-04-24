import 'package:json_annotation/json_annotation.dart';

import '../core/consts/app_conts.dart';
import 'base_model.dart';
import 'goal_week_model.dart';

part 'goal_model.g.dart';

@JsonSerializable(explicitToJson: true) 
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

  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoalModelToJson(this);

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
    var currency = L10n.getCurrency();
    return '${currency.format(qtd)}';
  }

  String getRemainWeeks() {
    var diff = dateEnd.difference(DateTime.now()).inDays;
   
    return (diff ~/ 7).toString();
  }
}
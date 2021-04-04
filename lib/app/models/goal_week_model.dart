import 'package:financialcontroleeapp/app/core/consts/app_conts.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:money2/money2.dart';

import 'base_model.dart';

part 'goal_week_model.g.dart';

@JsonSerializable()
class GoalWeek extends BaseModel {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'week')
  int week;
  @JsonKey(name: 'money')
  double money;
  @JsonKey(name: 'date')
  DateTime date;
  @JsonKey(name: 'saved')
  bool saved;
  @JsonKey(name: 'year_goal_id', includeIfNull: false)
  String? yearGoalId;

  GoalWeek({
    required this.title, 
    required this.money, 
    required this.date, 
    required this.saved,
    this.yearGoalId,
    required this.week,
  });

  factory GoalWeek.fromJson(Map<String, dynamic> json) =>
      _$GoalWeekFromJson(json);

  Map<String, dynamic> toJson() => _$GoalWeekToJson(this);

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    map['title'] = title;
    map['money'] = money;
    map['date'] = date;
    map['saved'] = saved;
    return map;
  }

  String getMoneyFormat(double qtd) {
    var currency = L10n.getCurrency();
    return '${currency.format(qtd)}';
  }
}
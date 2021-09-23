import 'package:json_annotation/json_annotation.dart';

import '../base_model.dart';

part 'year_goal_challenge_week_model.g.dart';

@JsonSerializable()
class YearGoalChallengeWeek extends BaseModel {
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

  YearGoalChallengeWeek({
    required this.title,
    required this.money,
    required this.date,
    required this.saved,
    this.yearGoalId,
    required this.week,
  });

  factory YearGoalChallengeWeek.fromJson(Map<String, dynamic> json) =>
      _$YearGoalChallengeWeekFromJson(json);

  Map<String, dynamic> toJson() => _$YearGoalChallengeWeekToJson(this);

  String getMoneyFormat(double qtd) {
    // var currency = L10n.getCurrency();
    // return '${currency.format(qtd)}';
    return '';
  }
}

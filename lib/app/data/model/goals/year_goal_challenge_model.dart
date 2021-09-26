import 'package:json_annotation/json_annotation.dart';

import '../base_model.dart';
import 'year_goal_challenge_week_model.dart';

part 'year_goal_challenge_model.g.dart';

@JsonSerializable(explicitToJson: true)
class YearGoalChallenge extends BaseModel {
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
  double progress;
  @JsonKey(name: 'qtd_saved')
  double qtdSaved;
  @JsonKey(includeIfNull: false)
  double total;
  @JsonKey(name: 'TB_YEAR_GOAL_WEEKs', toJson: customToJsonWeeks)
  List<YearGoalChallengeWeek>? weeksGoal = [];

  YearGoalChallenge(
      {required this.title,
      required this.moneyStart,
      required this.dateStart,
      required this.moneyEnd,
      required this.dateEnd,
      required this.progress,
      required this.qtdSaved,
      required this.userUid,
      this.weeksGoal,
      this.total = 0.0});

  factory YearGoalChallenge.fromJson(Map<String, dynamic> json) =>
      _$YearGoalChallengeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$YearGoalChallengeToJson(this);

  static Map<String, dynamic> customToJsonWeeks(
      List<YearGoalChallengeWeek>? weeks) {
    return {'data': weeks?.map((e) => e.toJson()).toList()};
  }

  String getRemainWeeks() {
    var diff = dateEnd.difference(DateTime.now()).inDays;

    return (diff ~/ 7).toString();
  }
}

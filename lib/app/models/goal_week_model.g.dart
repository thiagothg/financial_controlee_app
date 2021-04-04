// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_week_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalWeek _$GoalWeekFromJson(Map<String, dynamic> json) {
  return GoalWeek(
    title: json['title'] as String?,
    money: (json['money'] as num).toDouble(),
    date: DateTime.parse(json['date'] as String),
    saved: json['saved'] as bool,
    yearGoalId: json['year_goal_id'] as String?,
    week: json['week'] as int,
  )
    ..id = json['id'] as String?
    ..isActive = json['is_active'] as bool?
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
}

Map<String, dynamic> _$GoalWeekToJson(GoalWeek instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('is_active', instance.isActive);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  val['title'] = instance.title;
  val['week'] = instance.week;
  val['money'] = instance.money;
  val['date'] = instance.date.toIso8601String();
  val['saved'] = instance.saved;
  writeNotNull('year_goal_id', instance.yearGoalId);
  return val;
}

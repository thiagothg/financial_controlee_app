// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalModel _$GoalModelFromJson(Map<String, dynamic> json) {
  return GoalModel(
    title: json['title'] as String,
    moneyStart: (json['money_start'] as num).toDouble(),
    dateStart: DateTime.parse(json['date_start'] as String),
    moneyEnd: (json['money_end'] as num).toDouble(),
    dateEnd: DateTime.parse(json['date_end'] as String),
    progress: json['progress'] as int,
    qtdSaved: (json['qtd_saved'] as num).toDouble(),
    userUid: json['user_id'] as String,
    weeksGoal: (json['TB_YEAR_GOAL_WEEKs'] as List<dynamic>?)
        ?.map((e) => GoalWeek.fromJson(e as Map<String, dynamic>))
        .toList(),
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

Map<String, dynamic> _$GoalModelToJson(GoalModel instance) {
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
  val['money_start'] = instance.moneyStart;
  val['user_id'] = instance.userUid;
  val['money_end'] = instance.moneyEnd;
  val['date_start'] = instance.dateStart.toIso8601String();
  val['date_end'] = instance.dateEnd.toIso8601String();
  val['progress'] = instance.progress;
  val['qtd_saved'] = instance.qtdSaved;
  val['TB_YEAR_GOAL_WEEKs'] =
      instance.weeksGoal?.map((e) => e.toJson()).toList();
  return val;
}

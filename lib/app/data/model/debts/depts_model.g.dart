// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Depts _$DeptsFromJson(Map<String, dynamic> json) => Depts(
      title: json['title'] as String,
      total: (json['total'] as num).toDouble(),
      dateEnd: json['date_end'] == null
          ? null
          : DateTime.parse(json['date_end'] as String),
      dateStart: DateTime.parse(json['date_start'] as String),
      note: json['note'] as String,
      userUid: json['user_id'] as String,
      type: $enumDecode(_$TypeDebtsEnumMap, json['type']),
      id: json['id'] as String,
    )
      ..isActive = json['is_active'] as bool?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..updatedAt = json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String);

Map<String, dynamic> _$DeptsToJson(Depts instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is_active', instance.isActive);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('updated_at', instance.updatedAt?.toIso8601String());
  val['title'] = instance.title;
  val['total'] = instance.total;
  val['date_start'] = instance.dateStart.toIso8601String();
  val['date_end'] = instance.dateEnd?.toIso8601String();
  val['note'] = instance.note;
  val['user_id'] = instance.userUid;
  val['type'] = _$TypeDebtsEnumMap[instance.type];
  return val;
}

const _$TypeDebtsEnumMap = {
  TypeDebts.borrowed: 'borrowed',
  TypeDebts.lent: 'lent',
};

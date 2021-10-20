import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel {
  @JsonKey(name: 'id', includeIfNull: false)
  String id;
  @JsonKey(name: 'is_active', includeIfNull: false)
  bool? isActive;
  @JsonKey(name: 'created_at', includeIfNull: false)
  DateTime? createdAt;
  @JsonKey(name: 'updated_at', includeIfNull: false)
  DateTime? updatedAt;

  BaseModel({required this.id, this.isActive, this.createdAt, this.updatedAt});

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

  String documentId() => id;

  void disableDocument() => isActive = false;

  void enableDocument() => isActive = true;

  void setCreateTime() => createdAt = DateTime.now();

  void setUpdateTime() => updatedAt = DateTime.now();

  void setDocumentId(String idDoc) => id = idDoc;

  // DateTime dateTimeFromTimestamp(Timestamp timestamp) {
  //   return timestamp.toDate();
  // }

  DateTime fromJsonTime(int int) => DateTime.fromMillisecondsSinceEpoch(int);
}

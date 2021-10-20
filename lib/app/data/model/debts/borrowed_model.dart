import 'package:json_annotation/json_annotation.dart';

import '../base_model.dart';

part 'borrowed_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Borrowed extends BaseModel {
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'total')
  double total;
  @JsonKey(name: 'date_start')
  DateTime dateStart;
  @JsonKey(name: 'date_end')
  DateTime? dateEnd;
  @JsonKey(name: 'note')
  String note;
  @JsonKey(name: 'user_id')
  String userUid;

  Borrowed(
      {required this.title,
      required this.total,
      this.dateEnd,
      required this.dateStart,
      required this.note,
      required this.userUid,
      required String id})
      : super(id: id);

  factory Borrowed.fromJson(Map<String, dynamic> json) =>
      _$BorrowedFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowedToJson(this);
}

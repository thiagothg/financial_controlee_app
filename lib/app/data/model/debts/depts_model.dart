import '../base_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'depts_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Depts extends BaseModel {
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
  @JsonKey(name: 'type')
  TypeDebts type;

  Depts(
      {required this.title,
      required this.total,
      this.dateEnd,
      required this.dateStart,
      required this.note,
      required this.userUid,
      required this.type,
      required String id})
      : super(id: id);

  factory Depts.fromJson(Map<String, dynamic> json) =>
      _$DeptsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeptsToJson(this);
}

enum TypeDebts {
  @JsonValue("borrowed") borrowed,
  @JsonValue("lent") lent,
}


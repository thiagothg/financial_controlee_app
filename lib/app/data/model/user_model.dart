import 'package:financial_controlee_app/app/data/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends BaseModel {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'photo_url')
  String? urlImage;

  User(
      {required this.name,
      required this.email,
      this.urlImage,
      required String id})
      : super(id: id);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

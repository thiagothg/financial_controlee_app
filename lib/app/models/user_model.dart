import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel {
  @JsonKey(name: 'name')
  late String name;
  @JsonKey(name: 'bio')
  String? bio;
  @JsonKey(name: 'photo_url')
  String? photoUrl;
  @JsonKey(name: 'email')
  String email;

  UserModel({
    required this.name, 
    this.bio, 
    this.photoUrl, 
    required this.email
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    
    map['name'] = name;    
    // map['bio'] = bio;
    map['photoUrl'] = photoUrl;
    map['email'] = email;
    return map;
  }


  static UserModel fromFirebaseUser(User data) {
    var model = UserModel(
      name: data.displayName!,
      photoUrl: data.photoURL,
      email: data.email!,
      bio: data.phoneNumber
    );
    model.setCreateTime();
    model.setDocumentId(data.uid);
    return model;
  }
}
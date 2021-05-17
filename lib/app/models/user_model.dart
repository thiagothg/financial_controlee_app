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
  @JsonKey(name: 'image')
  String? image;

  UserModel({
    required this.name, 
    this.bio, 
    this.photoUrl, 
    required this.email,
    this.image
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

  static String kDefaultImageUrl =
      "https://images.unsplash.com/photo-1481627834876-b7833e8f5570?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=50&q=80";

}
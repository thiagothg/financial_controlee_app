import 'package:firebase_auth/firebase_auth.dart';

import 'base_model.dart';

class UserModel extends BaseModel {
  String name;
  String bio;
  String photoUrl;
  String email;

  UserModel({this.name, this.bio, this.photoUrl, this.email});

  UserModel.fromMap(Map<String, dynamic> json) : super.fromMap(json) {
    name = json["name"];
    bio = json["bio"];
    photoUrl = json["photoUrl"];
    email = json["email"];
  }

  UserModel.toModelFirebaseUser(User data) {
    name = data.displayName;
    photoUrl = data.photoURL;
    email = data.email;
    id = data.uid; 
  }

  @override
  Map toMap() {
    var map = super.toMap();
    
    map['name'] = name;    
    // map['bio'] = bio;
    map['photoUrl'] = photoUrl;
    map['email'] = email;
    return map;
  }
}
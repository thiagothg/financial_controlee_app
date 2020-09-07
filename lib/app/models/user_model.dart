import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'base_model.dart';

class User extends BaseModel {
  String name;
  String bio;
  String photoUrl;
  String email;

  User({this.name, this.bio, this.photoUrl, this.email});

  User.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    name = document.data["name"];
    bio = document.data["bio"];
    photoUrl = document.data["photoUrl"];
    email = document.data["email"];
  }

  User.toModelFirebaseUser(FirebaseUser data) {
    name = data.displayName;
    photoUrl = data.photoUrl;
    email = data.email;
    id = data.uid; 
  }

  @override
  Map toMap() {
    var map = super.toMap();
    map['name'] = name;
    map['bio'] = bio;
    map['photoUrl'] = photoUrl;
    map['email'] = email;
    return map;
  }
}
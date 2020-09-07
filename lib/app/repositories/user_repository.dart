import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

import 'firebase_repository_base.dart';

class UserRepository extends FirebaseRepositoyBase<User> {
  
  @override
  String get collection => 'users';

  @override
  User Function(DocumentSnapshot document) get fromMap
    => (document) => User.fromMap(document);

  Future<bool> exists(String id) async {
    var doc = await firestore.collection(collection)
        .document(id).get();
    return doc.exists;
  }

  Future<void> create(User model) async {
    model.setCreateTime();
    model.setUpdateTime();
    await firestore.collection(collection)
        .document(model.id).setData(model.toMap());
  }
}
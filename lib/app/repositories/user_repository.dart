import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

import 'firebase_repository_base.dart';

class UserRepository extends FirebaseRepositoyBase<UserModel> {
  
  @override
  String get collection => 'users';

  @override
  UserModel Function(DocumentSnapshot document) get fromMap
    => (document) => UserModel.fromMap(document);

  Future<bool> exists(String id) async {
    var doc = await firestore.collection(collection)
        .doc(id).get();
    return doc.exists;
  }

  Future<void> create(UserModel model) async {
    model.setCreateTime();
    model.setUpdateTime();
    await firestore.collection(collection)
        .doc(model.id).set(model.toMap());
  }
}
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../models/user_model.dart';

import 'documents/user_doc.dart';
import 'firebase_repository_base.dart';

class UserRepository extends FirebaseRepositoyBase<UserModel> {
  
  final HasuraConnect connect;

  UserRepository(this.connect);

  @override
  String get collection => 'TB_USERS';

  @override
  UserModel Function(DocumentSnapshot document) get fromMap
    => (document) => UserModel.fromMap(document);

  Future<bool> exists(String id) async {
    // var doc = await firestore.collection(collection)
    //     .doc(id).get();
    // return doc.exists;

    var result = await connect.query(userByIdQuery, variables: {
      'id': id
    }).then((res) => res['data']['control_app_TB_USERS_by_pk']);

    return (result !=  null); 
  }

  Future<void> create(UserModel model) async {
    await connect.mutation(userInsertQuery, 
      variables: model.toMap()
    );
  }
}
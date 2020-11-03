import 'dart:async';

import 'package:hasura_connect/hasura_connect.dart';

import '../models/user_model.dart';

import 'documents/user_doc.dart';

class UserRepository {
  
  final HasuraConnect connect;

  UserRepository(this.connect);

  String get collection => 'TB_USERS';

  UserModel Function(Map<String, dynamic> json) get fromMap
    => (json) => UserModel.fromMap(json);

  Future<bool> exists(String id) async {
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
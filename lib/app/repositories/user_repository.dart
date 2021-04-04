import 'dart:async';

import 'package:hasura_connect/hasura_connect.dart';

import '../core/responses/response_builder.dart';
import '../core/responses/response_default.dart';
import '../interfaces/user_repository_interface.dart';
import '../models/goal_model.dart';
import '../models/user_model.dart';
import 'documents/user_doc.dart';

class UserRepository implements IUserRepositoryInterface {
  
  final HasuraConnect connect;

  UserRepository(this.connect);

  String get collection => 'TB_USERS';

  Future<bool> exists(String id) async {
    var map = <String, dynamic>{};
    map['id'] = id;
    var result = await connect.query(userByIdQuery, 
      variables: map)
      .then((res) => res['data']['FINANCIAL_APP_TB_USERS_by_pk']);

    return (result !=  null); 
  }

  Future<void> create(UserModel model) async {
    await connect.mutation(userInsertQuery, 
      variables: model.toMap()
    );
  }

  @override
  Future<DefaultResponse> createGoal(GoalModel model) {
    // TODO: implement createGoal
    throw UnimplementedError();
  }

  @override
  Future<DefaultResponse> get(String id) async {
    try {
      var map = <String, dynamic>{};
      map['id'] = id;
      
      var result = await connect.query(userByIdQuery, 
        variables: map)
        .then((res) => res['data']['FINANCIAL_APP_TB_USERS_by_pk']);

      return Future.value(
        ResponseBuilder.success<UserModel>(
          object: UserModel.fromJson(result)
        )
      );
    } on Exception catch (e) {
      return Future.value(
        ResponseBuilder.failed(object: e, message: e.toString())
      );
    }
    }
  
    @override
    Future<DefaultResponse> update(GoalModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
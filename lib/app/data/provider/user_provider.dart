import '../../global/core/services/gql_client.dart';

class UserProvider {
  final GraphQLClient _gqlClient;
  UserProvider(this._gqlClient);

  String get userTable => 'users';

  Future<Map<String, dynamic>> getUserId(String uid) async {
    var map = <String, dynamic>{};
    map['id'] = uid;

    // var result = await _gqlClient.connect
    //     .query(userByIdQuery, variables: map)
    //     .then((res) => res['data']['FINANCIAL_APP_TB_USERS_by_pk']);

    return {};
  }
}

import 'package:financial_controlee_app/app/data/model/user_model.dart';
import 'package:financial_controlee_app/app/data/provider/user_provider.dart';
import 'package:financial_controlee_app/app/global/core/services/gql_client.dart';
import 'package:get/get.dart';

class UserRepository {
  final UserProvider userProvider = UserProvider(Get.find<GraphQLClient>());

  UserRepository();

  Future<User?> getUser(String uid) async {
    // var res = await userProvider.getUserId(uid);
    // print(res);
  }
}

import 'package:financial_controlee_app/app/data/model/user_model.dart';
import 'package:financial_controlee_app/app/data/provider/auth/auth_provider.dart';
import 'package:financial_controlee_app/app/global/core/services/gql_client.dart';
import 'package:get/get.dart';

class AuthRepository {
  final AuthProvider authProvider = AuthProvider(Get.find<GraphQLClient>());

  ///
  Future<UserModel?> signup(String email, String password) async {
    return await authProvider.signup(email, password);
  }

  ///
  Future<UserModel?> login(String email, String password) async {
    return await authProvider.login(email, password);
  }

  Future<void> logout() async {
    authProvider.logout();
  }

  Future<UserModel?> signInWithGoogle() async {
    return await authProvider.signInWithGoogle();
  }
}

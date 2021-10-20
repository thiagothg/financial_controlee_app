import '../../model/user_model.dart';
import '../../provider/auth/auth_provider.dart';
import '../../../global/core/services/gql_client.dart';
import 'package:get/get.dart';

class AuthRepository {
  final AuthProvider authProvider = AuthProvider(Get.find<GraphQLClient>());

  ///
  Future<User?> signup(String email, String password, String name) async {
    return await authProvider.signup(email, password, name);
  }

  ///
  Future<User?> login(String email, String password) async {
    return await authProvider.login(email, password);
  }

  Future<void> logout() async {
    authProvider.logout();
  }

  Future<User?> signInWithGoogle() async {
    return await authProvider.signInWithGoogle();
  }

  Future<void> forgotPassword(String email) async {
    await authProvider.resetPassword(email);
  }

  Future<User?> signInWithfacebook() async {
    return await authProvider.signInFacebook();
  }

  Future<User?> signInWithApple() async {
    return await authProvider.signInApple();
  }
}

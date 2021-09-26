import '../../data/repository/auth/auth_repository.dart';
import '../controllers/app_controller.dart';
import '../controllers/auth_controller.dart';
import '../core/services/gql_client.dart';
import '../../theme/theme_provider.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GraphQLClient>(GraphQLClient(), permanent: true);
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut(() => ThemeService());
    // Get.lazyPut<LocalStorage>(() => LocalStorageImpl());
    // Get.put<HttpClient>(HttpClientImpl(Dio()), permanent: true);
    Get.put<AuthController>(AuthController(Get.find<AuthRepository>()),
        permanent: true);
    Get.put<AppController>(AppController(), permanent: true);
  }
}

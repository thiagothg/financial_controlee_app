import 'package:dio/dio.dart';
import 'package:financial_controlee_app/app/data/repository/auth/auth_repository.dart';
import 'package:financial_controlee_app/app/global/controllers/app_controller.dart';
import 'package:financial_controlee_app/app/global/controllers/auth_controller.dart';
import 'package:financial_controlee_app/app/global/core/services/gql_client.dart';
import 'package:financial_controlee_app/app/theme/theme_provider.dart';
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

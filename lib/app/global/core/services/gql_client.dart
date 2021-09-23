import 'package:financial_controlee_app/app/global/controllers/auth_controller.dart';
import 'package:financial_controlee_app/app/global/core/conts/constants.dart';
import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';

class GraphQLClient {
  HasuraConnect connect = HasuraConnect(HasuraConfig.hasuraUrl,
      headers: {'hasura_key_admin': 'ga0RGNYHvNM5d0SLGQfpQWAPGJ8='}
      // localStorageDelegate: () => LocalStorageHive(),
      // token: (isError) async {
      //   if (isError) {
      //     // Get.offAndToNamed(Routers.login);
      //   }

      //   if (AuthController.to.token != null) {
      //     return 'Bearer ${AuthController.to.token}';
      //   }
      //   return null;
      // },
      );
}

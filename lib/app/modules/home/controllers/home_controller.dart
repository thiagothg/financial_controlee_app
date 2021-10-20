import '../../../global/services/auth_service.dart';

import '../../../data/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Essencial
  final auth = Get.find<AuthService>();

  Rx<User?> get getUser => Rx<User?>(auth.user.value?.user);

  @override
  void onClose() {}
}

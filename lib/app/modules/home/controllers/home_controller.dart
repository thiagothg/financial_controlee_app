import '../../../data/model/user_model.dart';
import '../../../global/controllers/auth_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //Essencial
  final auth = Get.find<AuthController>();

  Rx<UserModel?> get getUser => Rx<UserModel?>(auth.user.value?.user);

  @override
  void onClose() {}
}

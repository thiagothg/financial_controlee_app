import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/user_model.dart';
import '../shared/auth/auth_controller.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  AuthController auth = Modular.get();

  @observable
  UserModel userModel = UserModel(
    name: '',
    email: ''
  );
  
  _HomeControllerBase() {
    autorun((_){
      userModel = auth.userModel;
    });
  }


  void logoff() async {
    await Modular.get<AuthController>().logout();
  }


}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/user_model.dart';
import '../shared/auth/auth_controller.dart';

part 'drawer_menu_controller.g.dart';

class DrawerMenuController = 
  _DrawerMenuControllerBase with _$DrawerMenuController;

abstract class _DrawerMenuControllerBase with Store {

  AuthController auth = Modular.get();

  @observable
  UserModel userModel = UserModel(
    name: '',
    email: ''
  );
  
  _DrawerMenuControllerBase() {
    autorun((_){
      userModel = auth.userModel;
    });
  }


  void logoff() async {
    await auth.logout();
  }
}

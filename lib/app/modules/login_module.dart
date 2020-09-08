import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/login_controller.dart';
import '../core/consts/routers_const.dart';
import '../screens/login/login_page.dart';


class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(RoutersConst.login, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}

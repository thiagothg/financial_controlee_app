import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/login_controller.dart';
import '../views/login/login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => LoginController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  // static Inject get to => Inject<LoginModule>.of();
}

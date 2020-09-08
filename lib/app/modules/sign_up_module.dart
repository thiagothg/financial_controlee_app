import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/sign_up_controller.dart';
import '../core/consts/routers_const.dart';
import '../screens/sign_up/sign_up_page.dart';


class SignUpModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignUpController()),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(RoutersConst.register, child: (_, args) => SignUpPage()),
  ];

  static Inject get to => Inject<SignUpModule>.of();
}

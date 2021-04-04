import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/welcome_controller.dart';
import '../views/welcome/welcome_page.dart';

class WelcomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => WelcomeController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, 
      child: (_, args) => WelcomePage(),
      children: []
    ),
  ];

  // static Inject get to => Inject<WelcomeModule>.of();
}

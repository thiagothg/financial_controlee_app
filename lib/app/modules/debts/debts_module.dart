import 'package:flutter_modular/flutter_modular.dart';

import '../../controllers/debts_store.dart';
import '../../views/tabs/debts/debts_page.dart';

class DebtsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DebtsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => DebtsPage()),

  ];

}
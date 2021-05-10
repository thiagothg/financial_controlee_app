import 'package:flutter_modular/flutter_modular.dart';

import '../../controllers/settings_store.dart';
import '../../views/tabs/settings/pages/theme_page.dart';
import '../../views/tabs/settings/settings_page.dart';

class SettingsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SettingsStore()),
    
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, 
      child: (_, args) => SettingsPage(),
      children: [
        ChildRoute('/theme', child: (_, __) => ThemePage()),
      ]
    ),
  ];

}
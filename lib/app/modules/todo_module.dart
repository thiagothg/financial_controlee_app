import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/todo_controller.dart';
import '../views/todo/todo_page.dart';

class TodoModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => TodoController(i.get())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => TodoPage()),
  ];

  // static Inject get to => Inject<TodoModule>.of();
}

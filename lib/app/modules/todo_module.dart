import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/todo_controller.dart';
import '../views/todo/todo_page.dart';

class TodoModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => TodoController(i.get())),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => TodoPage()),
  ];

  static Inject get to => Inject<TodoModule>.of();
}

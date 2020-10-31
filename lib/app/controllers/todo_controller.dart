import 'package:financialcontroleeapp/app/interfaces/todo_repository_interface.dart';
import 'package:financialcontroleeapp/app/models/todo_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'todo_controller.g.dart';

@Injectable()
class TodoController = _TodoControllerBase with _$TodoController;

abstract class _TodoControllerBase with Store {
  
  final ITodoRepositoryInterface repository;

  @observable
  ObservableStream<List<TodoModel>> todoList;

  _TodoControllerBase(this.repository) {
    getList();
  }


  Stream<List<TodoModel>> getList() async* {
    yield* await repository.getTodos().asObservable();
  }

  Future save(TodoModel model) => repository.save(model);

  Future delete(TodoModel model) => repository.delete(model);
}

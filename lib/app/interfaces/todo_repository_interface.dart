import 'dart:async';


import '../models/todo_model.dart';



abstract class ITodoRepositoryInterface {

  Stream<List<TodoModel>> getTodos();

  Future save(TodoModel model);

  Future delete(TodoModel model);
}
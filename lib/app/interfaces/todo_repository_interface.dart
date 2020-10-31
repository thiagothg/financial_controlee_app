import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financialcontroleeapp/app/models/todo_model.dart';
import '../core/responses/response_default.dart';

import 'base_model_interface.dart';


abstract class ITodoRepositoryInterface {

  Stream<List<TodoModel>> getTodos();

  Future save(TodoModel model);

  Future delete(TodoModel model);
}
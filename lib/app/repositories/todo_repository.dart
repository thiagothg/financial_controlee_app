import 'package:hasura_connect/hasura_connect.dart';

import '../interfaces/todo_repository_interface.dart';
import '../models/todo_model.dart';
import 'documents/todo_doc.dart';

class TodoHasuraRepository implements ITodoRepositoryInterface  {
  final HasuraConnect connect;

  TodoHasuraRepository(this.connect);

  @override
  Future delete(TodoModel model) {
    return connect.mutation(todosDeleteQuery, variables: {'id': model.id});
  }

  @override
  Stream<List<TodoModel>> getTodos() async* {
    yield* connect.subscription(todosQuery)
      .map((event) {
        return (event['data']['TB_TODOS'] as List).map((e) {
          return TodoModel.fromJson(e);
        }).toList();
      });
    
   
    // yield* connect.subscription(todosQuery)
    //   .then((result) async {
    //     var list = await result.first.then<List>((val) {
    //       return (val['data']['TB_TODOS']);
    //     });
       
    //     return list.map((json) {
    //       return TodoModel.fromJson(json);
    //     }).toList();
    //   }).asStream().asBroadcastStream(
    //     onListen: (data) {
    //       print('onListeb: $data');
    //     }
    //   );
  }

  @override
  Future save(TodoModel model) async {
    if (model.id == null) {
      var data = await connect
          .mutation(todosInsertQuery, variables: {'title': model.title});
          print(data);
      model.id = data['data']['insert_TB_TODOS_one']['id'];
    } else {
      connect.mutation(todosUpdateQuery, variables: {
        'id': model.id,
        'title': model.title,
        'check': model.check,
      });
    }
  }
}
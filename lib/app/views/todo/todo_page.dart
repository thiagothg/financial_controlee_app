import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../controllers/todo_controller.dart';
import '../../models/todo_model.dart';
import 'widgets/item_tile.dart';

class TodoPage extends StatefulWidget {
  final String title;
  const TodoPage({Key? key, this.title = "Todo"}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends ModularState<TodoPage, TodoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<TodoModel>>(
        stream: controller.getList(),
        builder: (context, snapshot) {
          print('SNASP');
          print(snapshot.connectionState);
          
          if(!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(snapshot.hasError) {
            print(controller.todoList?.error);
            return Center(
              child: ElevatedButton(
                onPressed: controller.getList,
                child: Text('Error'),
              ),
            );
          }
          if(snapshot.data != null) {
            print(snapshot.data?.length);
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (_, index) {
                var model = snapshot.data?[index] ?? TodoModel();
                return ItemTile(
                  model: model,
                  onTap: () {
                    _showDialog(model);
                  },
                );
              },
            ); 
          } else {
            return Container();
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog(TodoModel()),
        child: Icon(Icons.add),
      ),
    );
  }

  _showDialog(TodoModel model) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(model.title.isEmpty ? 'Novo' : 'Edição'),
          content: TextFormField(
            initialValue: model.title,
            onChanged: (value) => model.title = value,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'escreva...',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Modular.to.pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                await controller.save(model);
                Modular.to.pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      });
  }
}

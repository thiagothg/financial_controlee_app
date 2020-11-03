import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/todo_controller.dart';
import '../../../models/todo_model.dart';

class ItemTile extends StatelessWidget {
  final TodoModel model;
  final Function onTap;

  const ItemTile({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.title),
      onTap: onTap,
      leading: IconButton(
        icon: Icon(
          Icons.remove_circle_outline,
          color: Colors.red,
        ),
        onPressed: () {
          Modular.get<TodoController>().delete(model);
        },
      ),
      trailing: Checkbox(
        value: model.check,
        onChanged: (check) {
          model.check = check;
          Modular.get<TodoController>().save(model);
        },
      ),
    );
  }
}
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../controllers/year/goal_detail_controller.dart';
import '../../../../../models/goal_model.dart';
import 'widgets/goal_item.dart';
import 'widgets/header_widget.dart';

class GoalDetailPage extends StatefulWidget {
  final String title;
  final GoalModel model;
  const GoalDetailPage({Key key, 
    this.title = "GoalDetail", 
    this.model}) : super(key: key);

  @override
  _GoalDetailPageState createState() => _GoalDetailPageState();
}

class _GoalDetailPageState
    extends ModularState<GoalDetailPage, GoalDetailController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(widget.title),
            Text(widget.model.title),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.close,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                showModal();
              },
              child: Icon(
                Icons.edit,
                size: 26.0,
              ),
            )
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          HeaderWidget(
            model: widget.model,
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: widget.model.weeksGoal.length,
              separatorBuilder: (_, index) {
                return SizedBox(
                  height: 5,
                  child: Divider(height: 3)
                );
              }, 
              itemBuilder: (_, index) {
                return GoalItem(
                  model: widget.model.weeksGoal[index],
                );
              }, 
            ),
          )
        ],
      ),
    );
  }

  void showModal() {
    showTextInputDialog(
      barrierDismissible: false,
      title: 'Editar Titulo',
      message: 'type',
      context: context,
      textFields: [
        DialogTextField(
          initialText: widget.model.title,
          validator: (string) {
            return string.isEmpty ? 'nao pode ficar' : null;
          }
        )
      ]
    );
  }
}

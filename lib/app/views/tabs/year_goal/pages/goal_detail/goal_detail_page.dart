import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../controllers/year/goals_controller.dart';
import '../../../../../models/goal_model.dart';
import 'widgets/goal_item.dart';
import 'widgets/header_widget.dart';

class GoalDetailPage extends StatefulWidget {
  final String title;
  final GoalModel model;
  const GoalDetailPage(
      {Key? key, this.title = "GoalDetail", required this.model})
      : super(key: key);

  @override
  _GoalDetailPageState createState() => _GoalDetailPageState();
}

class _GoalDetailPageState
    extends ModularState<GoalDetailPage, GoalsController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    controller.setProgreess(widget.model.progress);
    controller.setGoalWeeks(widget.model.weeksGoal!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(widget.title),
            Text('${widget.model.title}'),
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
                onTap: showModal,
                child: Icon(
                  Icons.edit,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Observer(builder: (_) {
        return Column(
          children: <Widget>[
            HeaderWidget(model: widget.model),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: controller.goalsWeeks.length,
                //widget.model.weeksGoal?.length ?? 0,
                separatorBuilder: (_, index) {
                  return SizedBox(height: 5, child: Divider(height: 3));
                },
                itemBuilder: (_, index) {
                  // var item = widget.model.weeksGoal?[index];
                  var item = controller.goalsWeeks[index];

                  // return Observer(builder: (_) {
                  //   return CheckboxListTile(
                  //     key: UniqueKey(),
                  //     activeColor: Theme.of(context).primaryColor,
                  //     controlAffinity: ListTileControlAffinity.leading,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(15)),
                  //     value: controller.goalsWeeks[index].saved,
                  //     title: GoalItem(key: UniqueKey(), model: item),
                  //     onChanged: (x) async {
                  //       item.saved = !item.saved;

                  //       await controller.updateWeek(item, widget.model, index);
                  //       // setState(() {});
                  //     });
                  // });
                  return GoalItem(
                    model: item,
                    index: index,
                    onPressed: () {
                      print(index);
                      controller.toggleDone(index);
                    },
                  );
                },
              ),
            )
          ],
        );
      }),
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
                return string != null ? 'nao pode ficar' : null;
              })
        ]);
  }
}

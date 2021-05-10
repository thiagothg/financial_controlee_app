// import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../../../controllers/year/goals_controller.dart';
import '../../../../../../models/goal_week_model.dart';

class GoalItem extends StatefulWidget {
  final GoalWeek model;
  final VoidCallback? onPressed;
  final int index;

  const GoalItem({Key? key, 
  required this.model, 
  required this.onPressed,
  required this.index})
      : super(key: key);

  @override
  _GoalItemState createState() => _GoalItemState();
}

class _GoalItemState extends ModularState<GoalItem, GoalsController> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        key: UniqueKey(),
        leading: Observer(
          key: UniqueKey(),
          builder: (_) {
            return IconButton(
              key: UniqueKey(),
              icon: Icon(controller.goalsWeeks[widget.index].saved
                  ? Icons.check_circle
                  : Icons.check_circle_outline),
              onPressed: widget.onPressed);
        }),
        // leading: CheckboxListTile(
        //   value: false,
        //   title: Text('a'),
        //   onChanged: (x) {
        //     widget.model.saved = !widget.model.saved;
        //     setState(() {  });
        //   }
        // ),
        // CircularCheckBox(
        //
        //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //   checkColor: Colors.white,
        //   activeColor: Theme.of(context).primaryColor,
        //   disabledColor: Colors.grey,

        // ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Week ${widget.model.title.toString()}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.calendar,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                SizedBox(width: 10),
                Text(
                  DateFormat.yMd().format(widget.model.date),
                  style: TextStyle(fontSize: 13),
                ),
              ],
            )
          ],
        ),
        trailing: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                FontAwesomeIcons.moneyBillWave,
                color: Theme.of(context).primaryColor,
                size: 15,
              ),
              SizedBox(width: 10),
              Text(
                widget.model.getMoneyFormat(widget.model.money),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}

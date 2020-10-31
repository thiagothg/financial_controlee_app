import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/goal_week_model.dart';

class GoalItem extends StatefulWidget {
  final GoalWeek model;

  const GoalItem({Key key, this.model}) : super(key: key);

  @override
  _GoalItemState createState() => _GoalItemState();
}

class _GoalItemState extends State<GoalItem> {

  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircularCheckBox(
        value: widget.model.saved,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        checkColor: Colors.white,
        activeColor: Theme.of(context).primaryColor,
        disabledColor: Colors.grey,
        onChanged: (x) {
          widget.model.saved = !widget.model.saved;
          setState(() {  });
        }
      ),
      title: Text('Week ${widget.model.title.toString()}'),
      trailing: Text('R\$ ${widget.model.money.toString()}',
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      )
    );
  }
}
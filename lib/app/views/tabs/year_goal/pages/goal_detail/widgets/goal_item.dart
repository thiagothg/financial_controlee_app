import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Week ${widget.model.title.toString()}',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            children: [
              Icon(FontAwesomeIcons.calendar,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(width: 10),
              Text(DateFormat.yMd().format(widget.model?.date?.toDate()),
                style: TextStyle(
                  fontSize: 13
                ),
              ),
            ],
          )
        ],
      ),
      trailing: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(FontAwesomeIcons.moneyBillWave,
                color: Theme.of(context).primaryColor,
              size: 15,
            ),
            SizedBox(width: 10),
            Text(widget.model.getMoneyFormat(widget.model.money),
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      )
    );
  }
}
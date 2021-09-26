import 'package:financial_controlee_app/app/data/model/goals/year_goal_challenge_week_model.dart';
import 'package:financial_controlee_app/app/global/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

class WeekGoalCard extends StatelessWidget {
  final Rx<YearGoalChallengeWeek> model;
  final Function(bool)? onPressed;
  final int index;

  const WeekGoalCard(
      {Key? key,
      required this.model,
      required this.onPressed,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: GFCheckbox(
            size: GFSize.LARGE,
            type: GFCheckboxType.circle,
            onChanged: onPressed,
            value: model.value.saved,
            inactiveBorderColor: Theme.of(context).primaryColorLight),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Week ${model.value.title.toString()}',
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
                Flexible(
                  child: Text(
                    DateFormat.yMd().format(model.value.date),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            )
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.moneyBillWave,
              color: Theme.of(context).primaryColor,
              size: 15,
            ),
            SizedBox(width: 10),
            Flexible(
              child: Text(
                Utils().getMoneyFormat(model.value.money),
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ));
    // return CheckboxListTile(
    //     // minLeadingWidth: 0,
    //     contentPadding: EdgeInsets.symmetric(horizontal: 2),
    //     controlAffinity: ListTileControlAffinity.leading,
    //     // subtitle: Text(''),
    //     // isThreeLine: true,
    //     key: UniqueKey(),
    //     onChanged: onPressed,
    //     value: model.value.saved,
    //     selected: model.value.saved,
    //     secondary: Container(
    //       width: Get.mediaQuery.size.width * .35,
    //       child: Row(
    //           // mainAxisAlignment: MainAxisAlignment.end,
    //           // mainAxisSize: MainAxisSize.max,
    //           children: [
    //
    //           ]),
    //     ));
  }
}

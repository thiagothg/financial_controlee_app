import 'package:financial_controlee_app/app/global/utils/utils.dart';
import 'package:financial_controlee_app/app/routes/app_pages.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../data/model/goals/year_goal_challenge_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class YearGoalCard extends StatelessWidget {
  final YearGoalChallenge model;
  final VoidCallback onDelete;

  const YearGoalCard({Key? key, required this.model, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.YEAR_GOAL_CHALLENGE_DETAIL, arguments: model);
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(15),
        shape: Theme.of(context).cardTheme.shape,
        borderOnForeground: false,
        color: Theme.of(context).cardTheme.color,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: Get.mediaQuery.size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: showBottowActions(model),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Remaingn weeks',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    model.getRemainWeeks(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ends at',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMd().format(model.dateEnd),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              GFProgressBar(
                percentage: model.progress / 100,
                lineHeight: 20,
                progressBarColor: Theme.of(context).primaryColor,
                animation: true,
                child: Text(
                  '${(model.progress).toInt()}%',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              // FAProgressBar(
              //   progressColor: Theme.of(context).indicatorColor,
              //   animatedDuration: Duration(milliseconds: 600),
              //   size: 18,
              //   backgroundColor: Theme.of(context).disabledColor,
              //   currentValue: widget.model.progress,
              //   displayText: '%'
              // ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Utils().getMoneyFormat(model.qtdSaved),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'of',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 5),
                  Text(
                    Utils().getMoneyFormat(model.moneyEnd),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuButton showBottowActions(YearGoalChallenge goalModel) {
    return PopupMenuButton(
        padding: EdgeInsets.zero,
        iconSize: 32,
        onSelected: (val) {
          switch (val) {
            case 1: //Editar

              break;
            case 2: //Excluir
              onDelete();
              break;
            default:
          }
        },
        itemBuilder: (_) {
          return [
            PopupMenuItem(
              value: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(FontAwesomeIcons.edit),
                  SizedBox(width: 7),
                  Text(
                    'Editar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.red.shade800,
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Excluir',
                    style: TextStyle(
                        color: Colors.red.shade800,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ];
        });
  }
}

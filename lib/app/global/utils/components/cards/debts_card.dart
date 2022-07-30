import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils.dart';

class DebtsCard extends StatelessWidget {
  final DateTime? date;
  final String title;
  final double total;


  const DebtsCard({Key? key, this.date, required this.title, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _getDescriation(),
                    SizedBox(
                      width: 10,
                    ),
                    (date != null)
                        ? Text(DateFormat.yMd().format(date!))
                        : Text(''),
                  ],
                ),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (date != null)
                        ? Text(DateFormat.yMd().format(date!), 
                          style: Theme.of(context).textTheme.bodyText1
                        )
                        : Text(''),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyText1),
                    Text(Utils().getMoneyFormat(total), 
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getDescriation() {
    if (date == null) {
      return Text('No expiration date');
    } else if (date!.difference(DateTime.now()).inDays > 1) {
      return Text('Overdue - ');
    } else {
      return Text('');
    }
  }
}

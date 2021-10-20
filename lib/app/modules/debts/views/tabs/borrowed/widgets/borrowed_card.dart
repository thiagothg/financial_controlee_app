import '../../../../../../data/model/debts/borrowed_model.dart';
import '../../../../../../global/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BorrowedCard extends StatelessWidget {
  final Borrowed model;

  const BorrowedCard({Key? key, required this.model}) : super(key: key);

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
                    (model.dateEnd != null)
                        ? Text(DateFormat.yMd().format(model.dateEnd!))
                        : Text(''),
                  ],
                ),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (model.dateEnd != null)
                        ? Text(DateFormat.yMd().format(model.dateEnd!))
                        : Text(''),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(model.title),
                    Text(Utils().getMoneyFormat(model.total)),
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
    if (model.dateEnd == null) {
      return Text('No expiration date');
    } else if (model.dateEnd!.difference(DateTime.now()).inDays > 1) {
      return Text('Overdue - ');
    } else {
      return Text('');
    }
  }
}

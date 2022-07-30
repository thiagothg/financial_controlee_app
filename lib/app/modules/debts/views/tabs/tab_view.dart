import 'package:flutter/material.dart';

import '../../../../data/model/debts/depts_model.dart';
import '../../../../global/utils/components/cards/debts_card.dart';
import '../../../../global/utils/utils.dart';

class TabView extends StatelessWidget {
  final List list;
  double total;


  TabView({Key? key, required this.list, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(5),
                height: 50,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        'Total ',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        Utils().getMoneyFormat(total),
                        style: Theme.of(context).textTheme.headline5,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      Depts model = list[index];

                      total += model.total;

                      return DebtsCard(
                       date: model.dateEnd,
                       title: model.title,
                       total: model.total,
                      );
                    }),
              ),
            ],
    );
  }
}
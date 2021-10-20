import '../../../../../data/model/debts/borrowed_model.dart';
import '../../../../../global/utils/utils.dart';
import '../../../../../routes/app_pages.dart';

import '../../../controllers/debts_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'widgets/borrowed_card.dart';

class BorrowedTabView extends StatelessWidget {
  BorrowedTabView({Key? key}) : super(key: key);

  final controller = Get.find<DebtsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.DEBTS_ADD);
          },
          child: const Icon(Icons.add),
          // backgroundColor: Colors.green,
        ),
        body: controller.obx(
          (listBorrowed) => Column(
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
                        Utils().getMoneyFormat(controller.totalBorrowed.value),
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
                    itemCount: listBorrowed.length,
                    itemBuilder: (context, index) {
                      Borrowed borrowed = listBorrowed[index];
                      return BorrowedCard(
                        model: borrowed,
                      );
                    }),
              ),
            ],
          ),
          onError: (err) => Expanded(child: Center(child: Text('$err'))),
          onLoading: Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: Expanded(
              child: Center(child: Text('Nenhum agendamento realizado.'))),
        ));
  }
}

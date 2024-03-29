import '../../../../../data/model/debts/depts_model.dart';
import '../../../../../global/utils/components/cards/debts_card.dart';
import '../../../../../global/utils/utils.dart';
import '../../../../../routes/app_pages.dart';

import '../../../controllers/debts_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../tab_view.dart';

class BorrowedTabView extends StatelessWidget {
  final controller = Get.find<DebtsController>();
  final TypeDebts type;
  BorrowedTabView({Key? key, this.type = TypeDebts.borrowed}) : super(key: key);


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
          (list) => TabView(list: list, total: controller.totalDebt.value,),
          onError: (err) => Expanded(child: Center(child: Text('$err'))),
          onLoading: Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: Expanded(
              child: Center(child: Text('Nenhum agendamento realizado.'))),
        ));
  }
}

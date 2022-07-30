import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../global/utils/utils.dart';
import '../../../../../routes/app_pages.dart';
import '../../../controllers/debts_controller.dart';
import '../tab_view.dart';

class LentTabView extends StatelessWidget {
  final controller = Get.find<DebtsController>();

  LentTabView({Key? key}) : super(key: key);

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
      // appBar: AppBar(
      //   title: Text('LentTabView'),
      //   centerTitle: true,
      // ),
      body: controller.obx(
          (list) => TabView(total: 0.0, list: list,),
          onError: (err) => Expanded(child: Center(child: Text('$err'))),
          onLoading: Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: Expanded(
              child: Center(child: Text('Nenhum agendamento realizado.'))),
        ),
      );
  }
}

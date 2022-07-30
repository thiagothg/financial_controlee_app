import '../../../data/model/debts/depts_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DebtsController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin {

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'I Borrored'),
    Tab(text: 'I lent'),
  ];

  TabController? tabController;

  // Borrored Page
  RxList<Depts> listBorrowed = <Depts>[].obs;
  RxDouble totalDebt = RxDouble(10.0);

  //add Page
  Rx<String?> dropdownValue = Rx(null);
  List<String> typeDebts = ['I borrewd', 'I lent'];
  RxBool isLoading = false.obs;



  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
    loadData(TypeDebts.borrowed);
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }

  void onChangedTab(int tab) {
    totalDebt.value = 0.0;
    loadData(tab == 0 ? TypeDebts.borrowed : TypeDebts.lent);
  }

  void loadData(TypeDebts typeDebts) async {
    listBorrowed = [
      Depts(
          id: '1',
          dateStart: DateTime.now(),
          dateEnd: DateTime.now().add(Duration(days: 30)),
          note: 'TESTE',
          total: 100000,
          userUid: '123',
          title: 'Borrowed 1',
          type: TypeDebts.borrowed
      ),
      Depts(
          id: '2',
          dateStart: DateTime.now(),
          // dateEnd: DateTime.now().add(Duration(days: 60)),
          note: 'TESTE 2',
          total: 1000,
          userUid: '123',
          title: 'Borrowed 2',
          type: TypeDebts.lent),
    ].obs;

    await Future.delayed(Duration(seconds: 2));
    change(listBorrowed, status: RxStatus.success());
  }

  Future<void> onSave() async {
    printInfo(info: 'onchange');
    await Future.delayed(Duration(seconds: 2));
     printInfo(info: 'finish');
  }
}

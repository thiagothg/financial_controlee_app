import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:financial_controlee_app/app/global/utils/components/buttons/custom_button.dart';
import 'package:financial_controlee_app/app/global/utils/components/inputs/custom_text_field.dart';
import '../../../../../global/utils/components/inputs/custom_dropdown_field.dart';

import '../../../controllers/debts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddBorrowedPage extends GetView<DebtsController> {
  const AddBorrowedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddBorrowed'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Obx(
            () => CustomDropDownField(
              dropdownValue: controller.dropdownValue.value,
              onChanged: (String? newValue) {
                controller.dropdownValue.value = newValue!;
              },
              items: controller.typeDebts,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Data'),
                ),
                SizedBox(
                  height: 5,
                ),
                DateRangeField(
                  margin: EdgeInsets.zero,
                  helpText: 'Datas',
                  fieldStartLabelText: 'Data Inicial',
                  initialValue: DateTimeRange(
                    start: DateTime.now(),
                    end: DateTime.now().add(
                      Duration(days: 5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  text: 'Note',
                  textInputAction: TextInputAction.newline,
                  contentPadding: EdgeInsets.all(5),
                  maxLines: 7,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomButton(text: 'Salvar'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

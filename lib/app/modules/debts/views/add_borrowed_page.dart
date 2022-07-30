import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../../../global/utils/components/buttons/custom_button.dart';
import '../../../global/utils/components/inputs/custom_text_field.dart';
import '../../../global/utils/components/inputs/custom_dropdown_field.dart';

import '../../../global/utils/helpers/language_helper.dart';
import '../../goals/year_goal_chalenge/views/widgets/field_form.dart';
import '../controllers/debts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddDebtsPage extends GetView<DebtsController> {
  const AddDebtsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Debt'),
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
                  child: Text('Date', style: Theme.of(context).textTheme.bodyText1,),
                ),
                SizedBox(
                  height: 5,
                ),
                DateRangeField(
                  // enabled: false,
                  margin: EdgeInsets.zero,
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                    hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                    prefix:  Icon(
                      FontAwesomeIcons.calendar,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  // helpText: 'Dates',
                  fieldStartLabelText: 'Inicial Date',
                  initialValue: DateTimeRange(
                    start: DateTime.now(),
                    end: DateTime.now().add(
                      Duration(days: 30),
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
                  height: 10,
                ),
                 CustomTextFormField(
                  text: 'How much',
                  description: '',
                  hintText: 'Ex: US\$ 10.00 is a great option',
                  // editingController: yearGoalController.qtdGoalController,
                  // prefix: Icon(
                  //   FontAwesomeIcons.dollarSign,
                  //   color: Theme.of(context).primaryColor,
                  // ),
                  textInputType: TextInputType.numberWithOptions(decimal: true, signed: true),
                  // enabled: !controller.loading,
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: Intl.getCurrentLocale(),
                      name: L10n.getCurrency().currencyName,
                      symbol: L10n.getCurrency().currencySymbol,

                      decimalDigits: 2,
                      // customPattern: ''
                    )
                  ],
                  // validator: MultiValidator([
                  //   RequiredValidator(errorText: 'valor is required'),
                  //   // QtdValidator()
                  // ]),
                ),
                SizedBox(
                  height: 25,
                ),
                Obx(() => CustomButton(
                  text: 'Save',
                  onPressed: controller.onSave,
                  isLoading: controller.isLoading.value,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

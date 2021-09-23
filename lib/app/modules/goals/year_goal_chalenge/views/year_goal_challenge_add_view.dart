import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:financial_controlee_app/app/global/utils/helpers/language_helper.dart';
import 'package:financial_controlee_app/app/modules/goals/goal/controllers/goal_controller.dart';
import 'package:financial_controlee_app/app/modules/goals/year_goal_chalenge/controllers/year_goal_challenge_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'widgets/field_form.dart';

class YearGoalChallengeAddView extends StatelessWidget {
  YearGoalChallengeAddView({Key? key}) : super(key: key);

  final YearGoalChallengeController yearGoalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Goal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: yearGoalController.formKey,
            child: Column(
              children: [
                FieldForm(
                  text: 'What is your next goal?',
                  description:
                      'Now that you know what you want. It is time to say how much you want to stored per week.',
                  editingController: yearGoalController.nameGoalController,
                  enabled: true,
                  hint: 'Ex: Travel to New York',
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'password is required'),
                    MinLengthValidator(8,
                        errorText: 'password must be at least 8 digits long'),
                  ]),
                  prefix: Icon(
                    FontAwesomeIcons.bullseye,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                FieldForm(
                  text: 'How much do you want to save per week?',
                  description:
                      'Now that you know what you want. It is time to say how much you want to stored per week.',
                  hint: 'Ex: US\$ 10.00 is a great option',
                  editingController: yearGoalController.qtdGoalController,
                  prefix: Icon(
                    FontAwesomeIcons.dollarSign,
                    color: Theme.of(context).primaryColor,
                  ),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  // onChanged: controller.setQtdGoal,
                  // enabled: !controller.loading,
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                        locale: Intl.getCurrentLocale(),
                        name: L10n.getCurrency().currencyName,
                        symbol: L10n.getCurrency().currencySymbol)
                  ],
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'valor is required'),
                    // QtdValidator()
                  ]),
                ),
                InkWell(
                  onTap: () => yearGoalController.selectDate(context),
                  child: FieldForm(
                    text: 'When do you want to start saving ?',
                    description:
                        'The time has come to define when you want to start saving',
                    hint: 'Date',
                    editingController: yearGoalController.dateGoalController,
                    prefix: Icon(
                      FontAwesomeIcons.calendar,
                      color: Theme.of(context).primaryColor,
                    ),
                    textInputType: TextInputType.datetime,
                    enabled: false,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        yearGoalController.goToPreviewView();
                      },
                      child: Text(
                        'Avançar',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

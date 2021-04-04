import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../../controllers/year/goals_controller.dart';
import '../../../../../shared/validators/create_year_goal_validators.dart';
import '../../../../../shared/widgets/custom_text_field.dart';
import 'field_form.dart';

class CreateGoalsPage extends StatefulWidget {
  final String title;
  const CreateGoalsPage({Key? key, this.title = "CreateGoals"})
      : super(key: key);

  @override
  _CreateGoalsPageState createState() => _CreateGoalsPageState();
}

class _CreateGoalsPageState
    extends ModularState<CreateGoalsPage, GoalsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        key: UniqueKey(),
        centerTitle: true,
        title: Text(widget.title),
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Observer(
          key: UniqueKey(),
          builder: (_) {
            return SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    FieldForm(
                      text: 'What is your next goal?',
                      description: 'Now that you know what you want. It is time to say how much you want to stored per week.',
                      editingController: controller.nameGoalController,
                      enabled: !controller.loading,
                      hint: 'Ex: Travel to New York',
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'password is required'),
                        MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
                      ]),
                      prefix: Icon(
                        FontAwesomeIcons.bullseye, 
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    FieldForm(
                      text: 'How much do you want to save per week?',
                      description: 'Now that you know what you want. It is time to say how much you want to stored per week.',
                      hint: 'Ex: US\$ 10.00 is a great option',
                      editingController: controller.qtdGoalController,
                      prefix: Icon(
                        FontAwesomeIcons.dollarSign, 
                        color: Theme.of(context).primaryColor,
                      ),
                      textInputType: TextInputType.numberWithOptions(
                        decimal: true
                      ),
                      onChanged: controller.setQtdGoal,
                      enabled: !controller.loading,
                      inputFormatters: [
                        CurrencyTextInputFormatter()
                      ],
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'valor is required'),
                        QtdValidator()
                      ]),
                    ),

                    GestureDetector(
                      onTap: () => controller.selectDate(context),
                      child: FieldForm(
                        text: 'When do you want to start saving ?',
                        description: 'The time has come to define when you want to start saving',
                        hint: 'Date',
                        editingController: controller.dateGoalController,
                        prefix: Icon(
                         FontAwesomeIcons.calendar, 
                          color: Theme.of(context).primaryColor,
                        ),
                        textInputType: TextInputType.datetime,
                        enabled: false,
                      ),
                    ),
                  
                    SizedBox(height: 20,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Observer(   
                          key: UniqueKey(),         
                          builder: (_) {
                            return ElevatedButton(
                              child: Text('Salvar',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                ),
                              ),
                              onPressed: controller.buttonPressed
                            );
                          }
                        )
                      ],
                    ),
                  ] 
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  Widget whenForm() {
    return Column(
      children: [
         Text('When do you want to start saving ?',
          style: Theme.of(context).textTheme.headline5?.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 20),
        Text(''
        '.'),
        
        SizedBox(height: 20),
          
        Observer(
          builder: (_) {
            return GestureDetector(
                
                child: CustomTextField(
                hint: 'Date',
                controller: controller.dateGoalController,
                prefix: Icon(
                  FontAwesomeIcons.calendar, 
                  color: Theme.of(context).primaryColor,
                ),
                textInputType: TextInputType.datetime,
                enabled: false,
              ),
            );
          },
        ),
      ],
    );
  }

}

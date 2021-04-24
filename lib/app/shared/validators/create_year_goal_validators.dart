   
import 'package:financialcontroleeapp/app/core/consts/app_conts.dart';
import 'package:form_field_validator/form_field_validator.dart';

class NameValidator extends TextFieldValidator {  
  // pass the error text to the super constructor  
  NameValidator({
    String errorText = 'Campo é obrigatorio'
  }) : super(errorText);  
  
  // return false if you want the validator to return error  
  // message when the value is empty.  
  @override  
  bool get ignoreEmptyValues => false;  
    
  @override  
  bool isValid(String? value) {  
    // return true if the value is valid according the your condition  
    // return hasMatch(r'^((+|00)?218|0?)?(9[0-9]{8})$', '$value');  
    return '$value'.trim().length >= 6;
  }  
} 

class QtdValidator extends TextFieldValidator {  
  // pass the error text to the super constructor  
  QtdValidator({
    String errorText = 'Campo não pode ser zero'
  }) : super(errorText);  
  
  // return false if you want the validator to return error  
  // message when the value is empty.  
  @override  
  bool get ignoreEmptyValues => false;  
    
  @override  
  bool isValid(String? value) {  
    var qtd = 0.0;
    
    if(value != null) {
      var currency = L10n.getCurrency();

      var number = currency.parse(value);
      qtd = number.toDouble();
    }
    return qtd >= 1.0;
  }  
} 
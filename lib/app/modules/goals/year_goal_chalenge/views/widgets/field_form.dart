import 'package:financial_controlee_app/app/global/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldForm extends StatelessWidget {
  final String text;
  final String? description;
  final TextEditingController? editingController;
  final Function(String)? onChanged;
  final bool? enabled;
  final String? hint;

  final Widget? prefix;
  final Widget? suffix;
  final bool? obscure;
  final TextInputType? textInputType;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const FieldForm(
      {Key? key,
      required this.text,
      this.description,
      this.editingController,
      this.onChanged,
      this.enabled,
      this.hint,
      this.inputFormatters,
      this.onTap,
      this.obscure,
      this.prefix,
      this.suffix,
      this.textInputType,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Column(key: UniqueKey(), children: [
      Text(
        '$text',
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      SizedBox(height: _size.height * 0.025),
      Text('$description'),
      SizedBox(height: _size.height * 0.025),
      CustomTextField(
        hint: hint,
        controller: editingController,
        prefix: prefix,
        onChanged: onChanged,
        enabled: enabled,
        validator: validator,
        textInputType: textInputType,
        suffix: suffix,
        obscure: obscure,
        onTap: onTap,
        inputFormatters: inputFormatters,
      ),
      SizedBox(height: _size.height * 0.025),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField({
    this.hint, 
    this.prefix, 
    this.suffix, 
    this.obscure = false,
    this.textInputType, 
    this.onChanged, 
    this.enabled, 
    this.controller,
    this.onTap,
    this.inputFormatters,
    this.validator,
  });

  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool? obscure;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool? enabled;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(29),
      ),
      padding: (prefix != null) 
        ? EdgeInsets.symmetric(horizontal: 10, vertical: 5)
        : const EdgeInsets.only(left: 16),
      child: TextFormField(
        key: UniqueKey(),
        onTap: onTap,
        controller: controller,
        obscureText: obscure ?? false,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        cursorColor: Theme.of(context).primaryColor,
        inputFormatters: inputFormatters,
        validator: validator,
        style: Theme.of(context).textTheme.subtitle2,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          errorStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
            color: Theme.of(context).errorColor
          )
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}

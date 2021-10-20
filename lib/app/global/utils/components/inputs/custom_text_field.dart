import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String? description;
  final TextEditingController? editingController;
  final Function(String)? onChanged;
  final bool? enabled;
  final String? hintText;

  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool obscure;
  final TextInputType? textInputType;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final bool expands;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextFormField(
      {this.text,
      this.description,
      this.editingController,
      this.onChanged,
      this.enabled,
      this.hintText,
      this.inputFormatters,
      this.onTap,
      this.obscure = false,
      this.prefix,
      this.prefixIcon,
      this.suffix,
      this.suffixIcon,
      this.textInputType,
      this.validator,
      this.focusNode,
      this.onSubmitted,
      this.readOnly = false,
      this.keyboardType,
      this.expands = false,
      Key? key,
      this.textInputAction,
      this.maxLines,
      this.minLines,
      this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: UniqueKey(),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (text != null)
            ? Text(
                ' $text',
                style: Get.theme.textTheme.bodyText1,
              )
            : Container(),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: editingController,
          obscureText: obscure,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          focusNode: focusNode,
          keyboardType: keyboardType,
          onTap: onTap,
          readOnly: readOnly,
          enabled: enabled,
          validator: validator,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          expands: expands,
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            prefix: prefix,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffix: suffix,
            hintText: hintText,
            contentPadding: contentPadding,
          ),
        ),
      ],
    );
  }
}

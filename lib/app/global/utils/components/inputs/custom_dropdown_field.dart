import 'package:flutter/material.dart';

class CustomDropDownField extends StatelessWidget {
  final String? dropdownValue;
  final Function(String?)? onChanged;
  final List<String>? items;

  const CustomDropDownField(
      {Key? key, this.dropdownValue, this.onChanged, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: DropdownButton<String>(
          hint: Text(
            'Select a type ',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Theme.of(context).primaryColorLight),
          ),
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward, color: Colors.white),
          iconSize: 24,
          elevation: 16,
          underline: Container(color: Colors.transparent),
          onChanged: onChanged,
          isExpanded: true,
          dropdownColor: Theme.of(context).primaryColor,
          items: items?.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Theme.of(context).primaryColorLight),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

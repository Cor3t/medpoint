import 'package:flutter/material.dart';
import '../config/template.dart';

class AppointmentCheckbox extends StatelessWidget {
  final bool value;
  final String title;
  final Function(bool?) onChanged;

  const AppointmentCheckbox({
    required this.value,
    required this.title,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: bodyTextStyle,
      ),
    );
  }
}

class CheckBoxModal {
  String? title;
  bool? value;

  CheckBoxModal({this.title, this.value = false});
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:task/core/helper/app_regex.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, this.labelText, this.validatorNumber, this.onSaved});

  final String? labelText;
  final String? validatorNumber;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          alignLabelWithHint: false,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty || !AppRegex.isNumber(value)) {
            return 'Please enter number $validatorNumber';
          }
          return null;
        },
        onSaved: onSaved,
        keyboardType: TextInputType.number,
      ),
    );
  }
}

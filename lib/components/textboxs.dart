// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FormTextBox extends StatelessWidget {
  final String hintText;
  final TextEditingController txtctrl;
  late String emailValue;
  FormTextBox(
      {super.key, required this.hintText, required this.txtctrl, emailValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $hintText';
          }
          return null;
        },
        onChanged: (value) {
          emailValue = value;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
        controller: txtctrl,
      ),
    );
  }
}

class PasswTextBox extends StatelessWidget {
  final String hintText;
  final TextEditingController txtctrl;
  late String passValue;
  PasswTextBox(
      {super.key, required this.hintText, required this.txtctrl, passValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: TextFormField(
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $hintText';
          }
          return null;
        },
        onChanged: (value) {
          passValue = value;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
        controller: txtctrl,
      ),
    );
  }
}

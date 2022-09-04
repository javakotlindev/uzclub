import 'dart:core';

import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController? controller;
  final double fontSize;
  final String labelText;
  final String hintText;
  final TextInputType keyBoardType;
  final bool obscureText;

  const BaseTextField(
      {Key? key,
      this.controller,
      this.fontSize = 16.0,
      this.labelText = "",
      this.hintText = "",
      this.keyBoardType = TextInputType.text,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
          labelStyle: const TextStyle(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: labelText,
          hintText: hintText),
      keyboardType: keyBoardType,
      obscureText: obscureText,
    );
  }
}

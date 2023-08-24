import 'package:flutter/material.dart';

Widget appTextField(
    {required String labelText,
    required IconData icon,
    bool obscureText = false,
    required String hintText,
    void Function(String value)? func}) {
  return TextField(
    obscureText: obscureText,
    onChanged: (value) => func!(value),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
        ),
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0)))),
  );
}

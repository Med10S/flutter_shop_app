import 'package:flutter/material.dart';

Widget appTextField(
    {TextEditingController? controller,
    String? labelText,
    required IconData icon,
    bool obscureText = false,
    required String hintText,
    void Function(String value)? func}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    onChanged: (value) => func!(value),
    decoration: InputDecoration(
        hoverColor: Colors.black,
        prefixIcon: Icon(
          icon,
        ),
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0)))),
  );
}

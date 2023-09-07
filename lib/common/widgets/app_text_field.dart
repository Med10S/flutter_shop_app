import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        contentPadding: EdgeInsets.only(top: 5.h, left: 10.h),
        hoverColor: Colors.black,
        prefixIcon: Icon(
          icon,
        ),
        labelText: labelText,
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(14.0)))),
  );
}

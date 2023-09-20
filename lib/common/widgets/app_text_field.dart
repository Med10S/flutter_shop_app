import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appTextField(
    {TextEditingController? controller,
    String? labelText,
    bool enableborder = false,
    required IconData icon,
    bool obscureText = false,
    required String hintText,
    void Function(String value)? func}) {
  return SizedBox(
    width: kIsWeb ? 400.w : null,
    child: TextField(
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
          enabledBorder: enableborder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                )
              : null,
          focusedBorder: enableborder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                )
              : null,
          disabledBorder: enableborder
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                )
              : null,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(14.0)))),
    ),
  );
}

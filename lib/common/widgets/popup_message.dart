import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget toast({required String msg, required Color color, required Icon icon}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(25.0), color: color),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(
          width: 12.0,
        ),
        Flexible(
            child: Text(
          msg,
        )),
      ],
    ),
  );
}

showToastError({required FToast fToast, required String msg}) {
  fToast.showToast(
    child: toast(
        msg: msg,
        color: Colors.red.withOpacity(0.5),
        icon: const Icon(Icons.error)),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}

showToastMessage({required FToast fToast, required String msg}) {
  fToast.showToast(
    child: toast(
        msg: msg,
        color: const Color.fromARGB(255, 114, 244, 54).withOpacity(0.5),
        icon: const Icon(Icons.check)),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}

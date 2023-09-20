import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Widget toast({required String msg, required Color color, required Icon icon}) {
//   return Container(
//     width: 320,
//     height: 70,
//     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//     decoration:
//         BoxDecoration(borderRadius: BorderRadius.circular(25.0), color: color),
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         icon,
//         const SizedBox(
//           width: 12.0,
//         ),
//         Flexible(
//             child: Text(
//           msg,
//         )),
//       ],
//     ),
//   );
// }
toast2({required String msg, required Color color}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      webBgColor: "#ff0000 ",
      fontSize: 16.0);
}

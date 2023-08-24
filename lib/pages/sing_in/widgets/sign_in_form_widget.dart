import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/utils/dimention.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common/widgets/button_widget.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: Dimenssion.height5dp * 2,
            horizontal:
                kIsWeb ? Dimenssion.width2dp * 50 : Dimenssion.width2dp * 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                  ),
                  labelText: "Email",
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0)))),
            ),
            SizedBox(height: Dimenssion.height2dp * 15),
            TextFormField(
              onChanged: (value) {},
              obscureText: true,
              validator: (value) {
                // Validation de la valeur du champ de texte
                if (value == '') {
                  return 'Le champ est vide'; // Message d'erreur en cas de champ vide
                } else if (value!.length < 6) {
                  return 'il doit contenir au moin 6 caracter';
                }
                // Retourne null si la validation est réussie
                return null;
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.fingerprint,
                ),
                labelText: "Password",
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0))),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "pas encore!!",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(decoration: TextDecoration.underline),
                  )),
            ),
            SizedBox(
              height: Dimenssion.height20dp * 5,
            ),
            Center(
                child: appButton(
                    width: Dimenssion.width5dp * 71,
                    height: Dimenssion.height5dp * 10,
                    buttonName: "Login",
                    isLogin: true,
                    onTapEvent: () {})),
            SizedBox(
              height: Dimenssion.height20dp,
            ),
            Center(
                child: appButton(
                    width: Dimenssion.width5dp * 71,
                    height: Dimenssion.height5dp * 10,
                    buttonName: "Register",
                    isLogin: false,
                    onTapEvent: () {
                      Navigator.pushNamed(context, "/singUp");
                    })),
          ],
        ),
      ),
    );
  }
}

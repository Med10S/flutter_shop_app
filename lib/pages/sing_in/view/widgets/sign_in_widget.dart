import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/utils/image_res.dart';

Widget thirdPartyLoging() {
  return Container(
    margin: const EdgeInsets.only(left: 80, right: 80, top: 40, bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _logingButtonOthers(imagePath: IconsRes.google, padding: 8.0),
        _logingButtonOthers(imagePath: IconsRes.appeleLogo, padding: 8.0),
        _logingButtonOthers(imagePath: IconsRes.facebook, padding: 0),
      ],
    ),
  );
}

Widget _logingButtonOthers({
  required double padding,
  required String imagePath,
}) {
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(
              255, 204, 204, 204), // Couleur de la bordure foncée
          width: 1.0, // Largeur de la bordure
        ),
      ),
      width: 40,
      height: 40,
      child: Image.asset(
        imagePath,
        fit: BoxFit.fitHeight,
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';
import 'package:flutter_shop_app_dbestech/common/utils/dimention.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    backgroundColor: AppColors.primaryBackgroud,
    activeIcon: _bottomContainer(image: false, color: AppColors.primaryElement),
    icon:
        _bottomContainer(image: false, color: AppColors.primaryFourElementText),
    label: "Home",
  ),
  BottomNavigationBarItem(
    backgroundColor: AppColors.primaryBackgroud,
    activeIcon: _bottomContainer(
        image: false, color: AppColors.primaryElement, iconData: Icons.search),
    icon: _bottomContainer(
        image: false,
        color: AppColors.primaryFourElementText,
        iconData: Icons.search),
    label: "Search",
  ),
  BottomNavigationBarItem(
    backgroundColor: AppColors.primaryBackgroud,
    activeIcon: _bottomContainer(
        image: false,
        color: AppColors.primaryElement,
        iconData: Icons.play_arrow_rounded),
    icon: _bottomContainer(
        image: false,
        color: AppColors.primaryFourElementText,
        iconData: Icons.play_arrow_rounded),
    label: "Play",
  ),
  BottomNavigationBarItem(
    backgroundColor: AppColors.primaryBackgroud,
    activeIcon: _bottomContainer(
        image: false,
        color: AppColors.primaryElement,
        iconData: Icons.message_rounded),
    icon: _bottomContainer(
        image: false,
        color: AppColors.primaryFourElementText,
        iconData: Icons.message_rounded),
    label: "Message",
  ),
  BottomNavigationBarItem(
    backgroundColor: AppColors.primaryBackgroud,
    activeIcon: _bottomContainer(
        image: false, color: AppColors.primaryElement, iconData: Icons.person),
    icon: _bottomContainer(
        image: false,
        color: AppColors.primaryFourElementText,
        iconData: Icons.person),
    label: "Profile",
  ),
];

///the bool [image] is set by deffault to true so you can assign a [imagePath] and modify [widthImage] and [heightImage]
///else if you make [image] bool to false you can assign [iconData] and [size]
///the [color] is the same for the icon and image
///
/// * exemple
///
/// bottomContainer(
///
///        image: false,
///        color: AppColors.primaryFourElementText,
///        iconData: Icons.search
///        size:20
/// ),
///  * Or
///
/// bottomContainer(
///
///        color: AppColors.primaryFourElementText,
///        imagePath: "/imagePath"
///        widthImage:20
///        heightImage:20
/// ),

Widget _bottomContainer(
    {bool image = true,
    double widthImage = 20,
    double heightImage = 20,
    String imagePath = "assets/icons/apple-logo.png",
    IconData iconData = Icons.home_rounded,
    double size = 25,
    required Color color}) {
  return SizedBox(
    width: Dimenssion.width5dp * 4,
    height: Dimenssion.height5dp * 4,
    child: _appImageWithColor(
        imagePath: imagePath,
        image: image,
        widthImage: widthImage,
        heightImage: heightImage,
        icon: iconData,
        sizeIcon: size,
        color: color),
  );
}

Widget _appImageWithColor(
    {String imagePath = "assets/icons/apple-logo.png",
    double widthImage = 16,
    double heightImage = 16,
    bool image = true,
    double? sizeIcon,
    IconData icon = Icons.home,
    required Color color}) {
  return image
      ? Image.asset(
          imagePath,
          width: widthImage,
          height: heightImage,
          color: color,
        )
      : Icon(
          icon,
          color: color,
          size: sizeIcon,
        );
}

Widget appScreens({required int index}) {
  List<Widget> sreens = const [
    Center(
      child: Icon(
        Icons.home_rounded,
        color: AppColors.primaryElement,
        size: 100,
      ),
    ),
    Center(
      child: Icon(
        Icons.search,
        color: AppColors.primaryElement,
        size: 100,
      ),
    ),
    Center(
      child: Icon(
        Icons.play_arrow_rounded,
        color: AppColors.primaryElement,
        size: 100,
      ),
    ),
    Center(
      child: Icon(
        Icons.message_rounded,
        color: AppColors.primaryElement,
        size: 100,
      ),
    ),
    Center(
      child: Icon(
        Icons.person,
        color: AppColors.primaryElement,
        size: 100,
      ),
    )
  ];
  return sreens[index];
}

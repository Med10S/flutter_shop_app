import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app_dbestech/common/models/course_entites.dart';
import 'package:flutter_shop_app_dbestech/common/utils/colors.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/text_widget.dart';

BoxDecoration appBoxShadow(
    {Color backgroundColor = AppColors.primaryFourthElementText,
    double borderRadius = 20,
    BoxBorder? boxBorder,
    double sR = 1,
    double bR = 2}) {
  return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: boxBorder,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxShadowWithRadius(
    {Color backgroundColor = AppColors.primaryFourthElementText,
    double sR = 1,
    BoxBorder? boxBorder,
    double bR = 2}) {
  return BoxDecoration(
      color: backgroundColor,
      border: boxBorder,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxDecorationTextField({
  required Color backgroundColor,
  required double borderRadius,
  Color borderColor = AppColors.primaryFourthElementText,
}) {
  return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: borderColor));
}

class AppBoxDecorationImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final FontWeight fontWeight;
  final CourseItem? courseItem;
  final double width, height;
  final bool info;
  final Function()? func;
  const AppBoxDecorationImage({
    super.key,
    required this.fit,
    required this.imagePath,
    this.func,
    this.width = 50,
    this.info = true,
    this.height = 50,
    this.courseItem,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
            image: DecorationImage(fit: fit, image: NetworkImage(imagePath)),
            borderRadius: BorderRadius.circular(20)),
        child: info
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 20.w,
                      ),
                      child: TextNormal(
                        textColors: Colors.white,
                        maxLines: 1,
                        softWrap: false,
                        text: courseItem!.name!,
                        texteSize: 12,
                        textAlign: TextAlign.left,
                        fontWeight: fontWeight,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, bottom: 7.h),
                      child: TextNormal(
                        textColors: AppColors.primaryFourthElementText,
                        maxLines: 1,
                        softWrap: false,
                        text: "${courseItem!.lesson_num!} Lesson(s)",
                        texteSize: 12,
                        textAlign: TextAlign.left,
                        fontWeight: fontWeight,
                        overflow: TextOverflow.fade,
                      ),
                    )
                  ])
            : Container(),
      ),
    );
  }
}

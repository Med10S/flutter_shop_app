import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app_dbestech/common/models/lesson_entities.dart';
import 'package:flutter_shop_app_dbestech/common/utils/image_res.dart';

import '../../../../common/models/course_entites.dart';
import '../../../../common/utils/colors.dart';
import '../../../../common/utils/constants.dart';
import '../../../../common/utils/formater_text.dart';
import '../../../../common/widgets/app_shadow.dart';
import '../../../../common/widgets/button_widget.dart';
import '../../../../common/widgets/text_widget.dart';

class CourseDetailThumbnail extends StatelessWidget {
  final CourseItem data;
  const CourseDetailThumbnail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      child: AppBoxDecorationImage(
        info: false,
        width: 325,
        height: 200,
        courseItem: data,
        imagePath:
            "${AppConstants.BASE_URL_For_NETWORK_IMAGE}${data.thumbnail}",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class CourseDetailIconsText extends StatelessWidget {
  final CourseItem data;

  const CourseDetailIconsText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: appBoxShadow(
                  borderRadius: 7, backgroundColor: AppColors.primaryElement),
              child: const TextNormal(
                  textColors: AppColors.primaryElementText,
                  text: "Author Page",
                  texteSize: 10),
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          Row(
            children: [
              const Icon(
                Icons.people,
                color: Colors.grey,
              ),
              TextNormal(
                text: data.follow.toString(),
                texteSize: 10,
                textColors: Colors.grey,
              )
            ],
          ),
          SizedBox(
            width: 30.w,
          ),
          Row(
            children: [
              const Icon(
                Icons.star_rate_rounded,
                color: Colors.grey,
              ),
              TextNormal(
                text: data.score.toString(),
                texteSize: 10,
                textColors: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}

class CourseDetailDescription extends StatelessWidget {
  final CourseItem data;
  const CourseDetailDescription({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String data2 = data.description!;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextNormal(
            useTextColor: false,
            textAlign: TextAlign.start,
            text: "Course Description",
            texteSize: 16,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            width: 300,
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                    color: AppColors.primaryThreeElementText, fontSize: 11),
                children: formaterTexte(data2),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CourseDetailGoBuyButton extends StatelessWidget {
  const CourseDetailGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20.h),
        child: appButton(
            buttonName: "Go Buy", width: 300, height: 50, onTapEvent: () {}));
  }
}

class CourseDetailsIncluds extends StatelessWidget {
  final CourseItem data;

  const CourseDetailsIncluds({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TextNormal(
            useTextColor: false,
            text: "Course includes",
            texteSize: 16,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          CourseInfo(
            iconData: Icons.videocam_rounded,
            iconSize: 23,
            textData: "${data.video_length} Hours video",
          ),
          CourseInfo(
            iconData: Icons.feed,
            iconSize: 23,
            textData: "${data.lesson_num} Number of Files",
          ),
          CourseInfo(
            iconData: Icons.cloud_download_rounded,
            iconSize: 23,
            textData: data.down_num != null
                ? "${data.down_num} Number of items to download"
                : "0 Number of items to download",
          ),
        ],
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final IconData iconData;
  final String textData;
  final double iconSize;
  const CourseInfo(
      {super.key,
      required this.iconData,
      required this.textData,
      required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Row(
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: appBoxShadow(
              borderRadius: 10,
              backgroundColor: AppColors.primaryElement,
            ),
            child: Icon(
              iconData,
              size: iconSize,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          TextNormal(
            text: textData,
            texteSize: 11,
            useTextColor: false,
          )
        ],
      ),
    );
  }
}

class LessonInfo extends StatelessWidget {
  final List<LessonItem> lessonData;
  const LessonInfo({
    super.key,
    required this.lessonData,
  });

  @override
  Widget build(BuildContext context) {
    print(lessonData[0].thumbnail);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, left: 25.w),
          child: const TextNormal(
            useTextColor: false,
            text: "Lesson list",
            texteSize: 14,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: lessonData.length,
            itemBuilder: (_, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: appBoxShadow(
                    sR: 1,
                    bR: 1,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                            ? const Color.fromRGBO(255, 255, 255, 1)
                            : const Color.fromARGB(38, 255, 255, 255),
                    borderRadius: 10),
                width: 325.w,
                height: 80.h,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      AppBoxDecorationImage(
                        info: false,
                        width: 60.w,
                        height: 60.w,
                        imagePath:
                            "${AppConstants.BASE_URL_For_NETWORK_IMAGE}${lessonData[index].thumbnail}",
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextNormal(
                            textColors:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                            text: lessonData[index].name!,
                            texteSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          TextNormal(
                            textColors:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.primaryThreeElementText
                                    : Colors.white,
                            text: truncateText(
                                lessonData[index].description!, 30),
                            texteSize: 12,
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      )
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }
}

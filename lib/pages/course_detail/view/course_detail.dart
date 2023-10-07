import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/app_bar_widget.dart';
import 'package:flutter_shop_app_dbestech/pages/course_detail/controller/course_controller.dart';

import 'widgets/course_detail_widgets.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  // ignore: prefer_typing_uninitialized_variables
  late var args;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id["id"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var courseData =
        ref.watch(CourseDetailControllerProvider(index: args.toInt()));

    var lessonData =
        ref.watch(CourseLessonListControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: buildAppBar(
          bottomShadow: false,
          context: context,
          title: "Course Detail",
          textColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          courseData.when(
            data: (data) => data == null
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CourseDetailThumbnail(data: data),
                      CourseDetailIconsText(
                        data: data,
                      ),
                      CourseDetailDescription(data: data),
                      const CourseDetailGoBuyButton(),
                      CourseDetailsIncluds(
                        data: data,
                      ),
                    ],
                  ),
            error: (error, stackTrace) => const Center(
              child: Text("error"),
            ),
            loading: () {
              return const SizedBox(
                height: 500,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          lessonData.when(
            data: (data) => data == null
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [LessonInfo(lessonData: data, ref: ref)],
                  ),
            error: (error, stackTrace) => const Center(
              child: Text("error"),
            ),
            loading: () {
              return const SizedBox(
                height: 500,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}

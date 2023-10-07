import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop_app_dbestech/common/widgets/app_bar_widget.dart';
import 'package:flutter_shop_app_dbestech/pages/lesson_detail/controller/lesson_controller.dart';
import 'package:video_player/video_player.dart';

import '../../../common/utils/constants.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late var args;
  @override
  void didChangeDependencies() {
    /// this id is given buy LessonInfo class in course_detail widget

    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id["id"];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lessonData = ref.watch(lessonDataControllerProvider);
    return Scaffold(
      appBar: buildAppBar(
          bottomShadow: false,
          context: context,
          title: "Lesson Detail",
          textColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black),
      body: Center(
        child: lessonData.value == null || lessonData.value!.lessonItem.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  lessonData.when(
                    data: (data) => Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${AppConstants.BASE_URL_For_NETWORK_IMAGE}${data.lessonItem[0].thumbnail}"))),
                          height: 200.h,
                          width: 352.w,
                          child: FutureBuilder(
                            future: data.initialVideoPlayer,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return videoPlayerController == null
                                    ? Container()
                                    : Stack(
                                        children: [
                                          VideoPlayer(videoPlayerController!),
                                        ],
                                      );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: const Icon(
                                  Icons.fast_rewind_outlined,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (data.isPlay) {
                                    videoPlayerController!.pause();
                                    ref
                                        .read(lessonDataControllerProvider
                                            .notifier)
                                        .playPause(false);
                                  } else {
                                    videoPlayerController!.play();
                                    ref
                                        .read(lessonDataControllerProvider
                                            .notifier)
                                        .playPause(true);
                                  }
                                },
                                child: data.isPlay
                                    ? const Icon(
                                        Icons.pause_circle,
                                        size: 30,
                                      )
                                    : const Icon(
                                        Icons.play_arrow,
                                        size: 30,
                                      ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              GestureDetector(
                                child: const RotatedBox(
                                  quarterTurns: 90,
                                  child: Icon(
                                    Icons.fast_rewind_outlined,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    error: (error, stackTrace) => const Center(
                      child: Text("error"),
                    ),
                    loading: () => const SizedBox(
                      height: 500,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

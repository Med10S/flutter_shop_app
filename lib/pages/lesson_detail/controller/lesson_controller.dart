// ignore_for_file: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_shop_app_dbestech/common/models/lesson_entities.dart';
import 'package:flutter_shop_app_dbestech/common/utils/constants.dart';
import 'package:flutter_shop_app_dbestech/pages/lesson_detail/repo/lesson_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'lesson_controller.g.dart';

VideoPlayerController? videoPlayerController;
@riverpod

///
///
/// [lessonDetailController] it's been activated from [course_detail_widget] in [LessonInfo] class
/// when the user click on the lesson from the the course detail page
/// he pass the [id] of the lesson to the [courseLessonDetail] API the return is [LessonDetailResponceEntity ]
/// with [data] in type [LessonVideoItem] so [response.data] hase [url] ,thumbnail end name
/// the [url] it's been converted to [uri] and passed to [videoPlayerController] he is a globle variable
/// [videoInstance] initialized by [responce.data] in lessonItem filed and memorized using reverpod provider
///
///
Future<void> lessonDetailController(LessonDetailControllerRef ref,
    {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response =
      await LessonRepo.courseLessonDetail(params: lessonRequestEntity);
  if (response.code == 200) {
    var url =
        "${AppConstants.BASE_URL_For_NETWORK_IMAGE}${response.data!.elementAt(0).url}";
    Uri uri = Uri.parse(url);

    print("first print $url");
    print("seconde print $uri");

    videoPlayerController = VideoPlayerController.networkUrl(uri);
    var initializeVideoPlayerFuture = videoPlayerController?.initialize();
    LessonVideo videoInstance = LessonVideo(
        lessonItem: response.data!,
        isPlay: true,
        url: url,
        initialVideoPlayer: initializeVideoPlayerFuture);
    print("my video thumbnail is ${response.data![0].thumbnail}");

    videoPlayerController?.play();
    videoPlayerController?.setVolume(50);
    ref
        .read(lessonDataControllerProvider.notifier)
        .updateLessonData(videoInstance);
  } else {
    if (kDebugMode) {
      print('responce failde ${response.code}');
    }
  }
}

@riverpod
class LessonDataController extends _$LessonDataController {
  @override
  FutureOr<LessonVideo> build() async {
    return LessonVideo();
  }

  void updateLessonData(LessonVideo lessons) {
    update((p0) => p0.copyWith(
        url: lessons.url,
        initialVideoPlayer: lessons.initialVideoPlayer,
        lessonItem: lessons.lessonItem,
        isPlay: lessons.isPlay));
  }

  void playPause(bool isPlay) {
    update((p0) => p0.copyWith(isPlay: isPlay));
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter_shop_app_dbestech/common/models/course_entites.dart';
import 'package:flutter_shop_app_dbestech/common/models/lesson_entities.dart';
import 'package:flutter_shop_app_dbestech/pages/course_detail/repo/cours_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'course_controller.g.dart';

@riverpod
// ignore: non_constant_identifier_names
Future<CourseItem?> courseDetailController(CourseDetailControllerRef,
    {required int index}) async {
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response = await CourseRepo.courseDetail(params: courseRequestEntity);
  if (response.code == 200) {
    return response.data;
  } else {
    if (kDebugMode) {
      print('responce failde ${response.code}');
    }
  }
  return null;
}

@riverpod
Future<List<LessonItem>?> courseLessonListController(
    courseLessonListControllerRef,
    {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response =
      await CourseRepo.courseLessonList(params: lessonRequestEntity);
  if (response.code == 200) {
    return response.data;
  } else {
    if (kDebugMode) {
      print('responce failde ${response.code}');
    }
  }
  return null;
}

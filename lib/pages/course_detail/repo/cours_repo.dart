import 'package:flutter_shop_app_dbestech/common/models/course_entites.dart';
import 'package:flutter_shop_app_dbestech/common/models/lesson_entities.dart';
import 'package:flutter_shop_app_dbestech/common/services/http_utlis.dart';

class CourseRepo {
  static Future<CourseDetailResponceEntity> courseDetail(
      {CourseRequestEntity? params}) async {
    var responce = await HttpUtil()
        .post("api/courseDetail", queryParameters: params?.toJson());
    return CourseDetailResponceEntity.fromJson(responce);
  }

  static Future<LessonListReResponceEntity> courseLessonList(
      {LessonRequestEntity? params}) async {
    var responce = await HttpUtil()
        .post("api/lessonList", queryParameters: params?.toJson());
    return LessonListReResponceEntity.fromJson(responce);
  }
}

import '../../../common/models/lesson_entities.dart';
import '../../../common/services/http_utlis.dart';

class CourseRepo {
  static Future<LessonListReResponceEntity> courseLessonList(
      {LessonRequestEntity? params}) async {
    var responce = await HttpUtil()
        .post("api/lessonList", queryParameters: params?.toJson());
    return LessonListReResponceEntity.fromJson(responce);
  }
}

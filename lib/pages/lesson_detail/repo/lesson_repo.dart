import '../../../common/models/lesson_entities.dart';
import '../../../common/services/http_utlis.dart';

class LessonRepo {
  //for Api reqest to my server
  /// [params] containe the id of the lesson witch will be giving to
  /// [post] in [HttpUtil] the responce is saved in [responce]
  /// it gonna be used in [lesson_Controller.dart] page

  static Future<LessonDetailResponceEntity> courseLessonDetail(
      {LessonRequestEntity? params}) async {
    var responce = await HttpUtil()
        .post("api/lessonDetail", queryParameters: params?.toJson());
    return LessonDetailResponceEntity.fromJson(responce);
  }
}

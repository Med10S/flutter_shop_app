import '../models/course_entites.dart';
import '../services/http_utlis.dart';

class CourseApi {
  static Future<CourseListResponceEntity> courseList() async {
    var responce = await HttpUtil().post(
      'api/courseListe',
    );
    return CourseListResponceEntity.fromJson(responce);
  }
}

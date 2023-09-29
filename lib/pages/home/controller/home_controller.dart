// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_shop_app_dbestech/common/Api/course_api.dart';
import 'package:flutter_shop_app_dbestech/common/models/course_entites.dart';
import 'package:flutter_shop_app_dbestech/common/models/user.dart';
import 'package:flutter_shop_app_dbestech/global.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeSreenBannerDots extends _$HomeSreenBannerDots {
  @override
  int build() => 0;

  void setIndex(int value) {
    state = value;
  }
}

@riverpod
class HomeUserProfile extends _$HomeUserProfile {
  @override
  FutureOr<UserProfile> build() {
    return Global.storageService.getUserProfile();
  }
}

@Riverpod(keepAlive: true)
class HomeCourseList extends _$HomeCourseList {
  Future<List<CourseItem>?> fetchCourseList() async {
    var result = await CourseApi.courseList();
    if (result.code == 200) {
      return result.data;
    }
    return null;
  }

  @override
  FutureOr<List<CourseItem>?> build() async {
    return fetchCourseList();
  }
}

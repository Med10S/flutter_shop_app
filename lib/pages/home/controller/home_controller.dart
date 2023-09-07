// ignore_for_file: depend_on_referenced_packages

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

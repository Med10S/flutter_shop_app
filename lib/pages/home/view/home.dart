import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/widgets/search_widget.dart';
import '../controller/home_controller.dart';
import 'widgets/home_widget.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  @override
  void didChangeDependencies() {
    _controller =
        PageController(initialPage: ref.watch(homeSreenBannerDotsProvider));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return /* Global.storageService.getUserProfile().accessToken == null
        ? Center(
            child: textNormal(
              text: "you are a bad user",
              texteSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        :*/
        SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: homeAppBar(ref),
          body: RefreshIndicator(
              onRefresh: () {
                return ref
                    .refresh(homeCourseListProvider.notifier)
                    .fetchCourseList();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      const HelloText(),
                      const UserName(),
                      SizedBox(
                        height: 20.h,
                      ),
                      searchBar(),
                      SizedBox(
                        height: 20.h,
                      ),
                      HomeBanner(ref: ref, controller: _controller),
                      const HomeMenuBar(),
                      CourseItemGride(ref: ref),
                    ],
                  ),
                ),
              ))),
    );
  }
}

import 'package:flutter/material.dart';

import '../../common/widgets/app_bar_widget.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "home page", context: context),
      body: Container(),
    );
  }
}

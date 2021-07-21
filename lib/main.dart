import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../theme.dart';
import '../views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      //We bind the app controller here
      // to fetch the initial data and run the app controller
      initialBinding: BindingsBuilder<AppController>.put(() => AppController()),
      home: const HomePage(),
    );
  }
}

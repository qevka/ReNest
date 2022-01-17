import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renest/styles/theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: RestTheme.lightTheme,
    ),
  );
}

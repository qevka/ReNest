import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

class RestTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
        //2
        primaryColor: Colors.white,
        textTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
        appBarTheme: AppBarTheme(
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.grey),
            color: Colors.white,
            toolbarTextStyle: TextStyle(color: Colors.black),
            titleTextStyle:
                TextStyle(color: Colors.black, fontFamily: ReNestFont.avenir, fontSize: 34, fontWeight: FontWeight.bold)),
        scaffoldBackgroundColor: ReNestColor.background,
        backgroundColor: ReNestColor.scaffoldLight,
        fontFamily: ReNestFont.avenir, //3
        buttonTheme: ButtonThemeData(
          // 4
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ));
  }
}

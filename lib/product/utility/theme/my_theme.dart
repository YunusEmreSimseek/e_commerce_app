import 'package:e_commerce_app/product/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  MyTheme();

  static final ThemeData dark = ThemeData.dark().copyWith();

  static final ThemeData light = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          titleTextStyle: TextStyle(color: ColorConstant.colorBlack, fontSize: 24)));
}

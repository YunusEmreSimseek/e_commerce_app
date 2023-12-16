import 'package:flutter/material.dart';

enum ImageEnum {
  iphone_8,
  // ignore: constant_identifier_names
  iphone_x,
  iphone_11,
  iphone_13,
  iphone_14,
  iphone_15,
}

extension ImageEnumExtesion on ImageEnum {
  String get toPath => 'assets/images/img_$name.png';
  Image get toImage => Image.asset(toPath);
}

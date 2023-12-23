import 'package:flutter/material.dart';

enum TextFieldDecorationEnums {
  email(
      decoration: InputDecoration(
    hintText: AutofillHints.email,
    prefixIcon: Icon(Icons.email_outlined),
  )),
  password(
      decoration: InputDecoration(
    hintText: AutofillHints.password,
    prefixIcon: Icon(Icons.password_outlined),
  )),
  name(decoration: InputDecoration()),
  phone(decoration: InputDecoration()),
  ;

  final InputDecoration decoration;

  const TextFieldDecorationEnums({required this.decoration});
}

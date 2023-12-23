import 'package:e_commerce_app/feature/login/login_view.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/utility/init/project_inits.dart';
import 'package:e_commerce_app/product/utility/theme/my_theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await ProjectInits.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.light,
      title: StringConstant.appName,
      home: const LoginView(),
    );
  }
}

import 'package:e_commerce_app/feature/base/base_scaffold.dart';
import 'package:e_commerce_app/product/utility/init/project_inits.dart';
import 'package:e_commerce_app/product/utility/theme/my_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectInits.init();
    return MaterialApp(
      theme: MyTheme.light,
      title: 'Material App',
      home: const BaseScaffold(),
    );
  }
}

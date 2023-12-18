import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

@immutable
final class ProjectInits {
  const ProjectInits._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

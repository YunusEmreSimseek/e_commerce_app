import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

final class ProjectInits {
  ProjectInits._();

  static Future<void> init() async {
    // Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

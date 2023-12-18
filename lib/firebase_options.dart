// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDF5T6Gy6fi6G_yKO3-RZho8SaISUL3O-c',
    appId: '1:34337218861:web:5346be28b3dbba8175f3a4',
    messagingSenderId: '34337218861',
    projectId: 'ecommerceapp-59ec8',
    authDomain: 'ecommerceapp-59ec8.firebaseapp.com',
    storageBucket: 'ecommerceapp-59ec8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuZpOiJZpxg5oevrv4C15odp7jjrAB-MU',
    appId: '1:34337218861:android:4fcc4fe02736292b75f3a4',
    messagingSenderId: '34337218861',
    projectId: 'ecommerceapp-59ec8',
    storageBucket: 'ecommerceapp-59ec8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAflIebfeyUwdZUVy-xUNWGnFmckXTlFro',
    appId: '1:34337218861:ios:dda37e6f4fbc096075f3a4',
    messagingSenderId: '34337218861',
    projectId: 'ecommerceapp-59ec8',
    storageBucket: 'ecommerceapp-59ec8.appspot.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAflIebfeyUwdZUVy-xUNWGnFmckXTlFro',
    appId: '1:34337218861:ios:f0790d55a7b4eb9e75f3a4',
    messagingSenderId: '34337218861',
    projectId: 'ecommerceapp-59ec8',
    storageBucket: 'ecommerceapp-59ec8.appspot.com',
    iosBundleId: 'com.example.eCommerceApp.RunnerTests',
  );
}
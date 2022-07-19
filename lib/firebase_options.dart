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
    apiKey: 'AIzaSyBd72fuNtMpQY5GNKoJyODKs4-zzZ14fMw',
    appId: '1:199522760172:web:28746567ee56635b2c7cc9',
    messagingSenderId: '199522760172',
    projectId: 'grading-standards',
    authDomain: 'grading-standards.firebaseapp.com',
    storageBucket: 'grading-standards.appspot.com',
    measurementId: 'G-X4VJW4VHDZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvIo2571RJfOcK_3rwjp1EtgPiZXtSzes',
    appId: '1:199522760172:android:a7b3c7916d00631b2c7cc9',
    messagingSenderId: '199522760172',
    projectId: 'grading-standards',
    storageBucket: 'grading-standards.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjDj0occLt7OoLOTA7MB0DuHro38OjPy8',
    appId: '1:199522760172:ios:431a08a39e1989e22c7cc9',
    messagingSenderId: '199522760172',
    projectId: 'grading-standards',
    storageBucket: 'grading-standards.appspot.com',
    iosClientId: '199522760172-tef8dr7kdetvcvgm06qs1uv2la2idmb2.apps.googleusercontent.com',
    iosBundleId: 'com.af.AF-Grading-Standards',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjDj0occLt7OoLOTA7MB0DuHro38OjPy8',
    appId: '1:199522760172:ios:b133ee60f33656732c7cc9',
    messagingSenderId: '199522760172',
    projectId: 'grading-standards',
    storageBucket: 'grading-standards.appspot.com',
    iosClientId: '199522760172-sbqa2dqh7t8ght1q7bqcriv97ttonsmj.apps.googleusercontent.com',
    iosBundleId: 'com.example.appPrototype',
  );
}

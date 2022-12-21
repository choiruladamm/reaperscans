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
    apiKey: 'AIzaSyCWxzGRGS367HX2m7Fvom5HL6q6Kt6WmA0',
    appId: '1:602028750602:web:6c8b2ad3a20565ce4d2cf3',
    messagingSenderId: '602028750602',
    projectId: 'authlogin-bca40',
    authDomain: 'authlogin-bca40.firebaseapp.com',
    storageBucket: 'authlogin-bca40.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBT80eUPUndLUa2k2_7MgunZOJ3aADTMOE',
    appId: '1:602028750602:android:8d440c0c57502cf44d2cf3',
    messagingSenderId: '602028750602',
    projectId: 'authlogin-bca40',
    storageBucket: 'authlogin-bca40.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAgVXr7T5zPPLlJ_-ZpgJMtn5U1-e0nfg',
    appId: '1:602028750602:ios:033f65967ad3f7564d2cf3',
    messagingSenderId: '602028750602',
    projectId: 'authlogin-bca40',
    storageBucket: 'authlogin-bca40.appspot.com',
    iosClientId: '602028750602-pvils06bh6je4rnbflf0864o72vacmfp.apps.googleusercontent.com',
    iosBundleId: 'com.example.reaperscans',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAgVXr7T5zPPLlJ_-ZpgJMtn5U1-e0nfg',
    appId: '1:602028750602:ios:033f65967ad3f7564d2cf3',
    messagingSenderId: '602028750602',
    projectId: 'authlogin-bca40',
    storageBucket: 'authlogin-bca40.appspot.com',
    iosClientId: '602028750602-pvils06bh6je4rnbflf0864o72vacmfp.apps.googleusercontent.com',
    iosBundleId: 'com.example.reaperscans',
  );
}
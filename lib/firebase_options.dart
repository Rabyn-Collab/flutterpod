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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCy7tOo3RAN-sYJVayC3eQDRD9_bMHZwLU',
    appId: '1:206166890342:web:256838f6a3c41a89ac5aa7',
    messagingSenderId: '206166890342',
    projectId: 'fire-some',
    authDomain: 'fire-some.firebaseapp.com',
    storageBucket: 'fire-some.appspot.com',
    measurementId: 'G-YDX29HQY16',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsmwy-S6wgd8qsXeruwC6NgBMqnNTkVO4',
    appId: '1:206166890342:android:15b2365078f05aecac5aa7',
    messagingSenderId: '206166890342',
    projectId: 'fire-some',
    storageBucket: 'fire-some.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAM2XiGqXEDhKAJOmGG5av4TXV4sYXmyM',
    appId: '1:206166890342:ios:3a6a3f1d14b4f40aac5aa7',
    messagingSenderId: '206166890342',
    projectId: 'fire-some',
    storageBucket: 'fire-some.appspot.com',
    iosClientId: '206166890342-v18lre88uhmiaj6rkhfgsvtma2p4m342.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterpod',
  );
}
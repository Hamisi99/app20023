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
    apiKey: 'AIzaSyDgQu2Wl9HRB3WS435FRFq42AmLmRRW50c',
    appId: '1:1001964992668:web:5609313e2d89595999d559',
    messagingSenderId: '1001964992668',
    projectId: 'plannettips',
    authDomain: 'plannettips.firebaseapp.com',
    storageBucket: 'plannettips.appspot.com',
    measurementId: 'G-00XSJHJLRP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAlwBsDuPOPATKj_48COiVoOf2pEiqROk',
    appId: '1:1001964992668:android:86bcc364b9d84e6899d559',
    messagingSenderId: '1001964992668',
    projectId: 'plannettips',
    storageBucket: 'plannettips.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuPC1YSOdXsyG9Fqu0iAvD6hFqf5nCraM',
    appId: '1:1001964992668:ios:dae2b5a097b5091399d559',
    messagingSenderId: '1001964992668',
    projectId: 'plannettips',
    storageBucket: 'plannettips.appspot.com',
    iosClientId: '1001964992668-qbacvqtokhprve60pt1bb68pk5bmu1gd.apps.googleusercontent.com',
    iosBundleId: 'com.example.sportapp',
  );
}

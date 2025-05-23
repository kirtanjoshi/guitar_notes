// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyC3gzxcXryFqkcXOIa5voRdyDSD9ZsgdLk',
    appId: '1:356743729723:web:eec481d624f8fa7abb821e',
    messagingSenderId: '356743729723',
    projectId: 'guitar-notes-c1a96',
    authDomain: 'guitar-notes-c1a96.firebaseapp.com',
    storageBucket: 'guitar-notes-c1a96.firebasestorage.app',
    measurementId: 'G-FWKBHYXN6Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGFA3Bs-wJ_iR-2a_pVd8HLAfJD1hyIKE',
    appId: '1:356743729723:android:24d3bcdda741e817bb821e',
    messagingSenderId: '356743729723',
    projectId: 'guitar-notes-c1a96',
    storageBucket: 'guitar-notes-c1a96.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8uWAdAzfQAOyoyi6l_fiU9Dcy-qqryrk',
    appId: '1:356743729723:ios:d18cfb9806da02c7bb821e',
    messagingSenderId: '356743729723',
    projectId: 'guitar-notes-c1a96',
    storageBucket: 'guitar-notes-c1a96.firebasestorage.app',
    iosBundleId: 'com.example.guitarNotes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3gzxcXryFqkcXOIa5voRdyDSD9ZsgdLk',
    appId: '1:356743729723:web:a804207a6a2ab56ebb821e',
    messagingSenderId: '356743729723',
    projectId: 'guitar-notes-c1a96',
    authDomain: 'guitar-notes-c1a96.firebaseapp.com',
    storageBucket: 'guitar-notes-c1a96.firebasestorage.app',
    measurementId: 'G-ELPMCYMLC4',
  );
}

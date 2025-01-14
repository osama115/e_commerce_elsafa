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
        return macos;
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
    apiKey: 'AIzaSyDGlnwSgBXp43kygvnpPNSkLe1CtvwXZp8',
    appId: '1:266058237320:web:c4691f44e3e74dffe7263d',
    messagingSenderId: '266058237320',
    projectId: 'el-safa-marwa',
    authDomain: 'el-safa-marwa.firebaseapp.com',
    storageBucket: 'el-safa-marwa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhZB-HbDOLs_ZUrHL_rFXD53qaF_5lqUA',
    appId: '1:266058237320:android:3329e2d6f95eb668e7263d',
    messagingSenderId: '266058237320',
    projectId: 'el-safa-marwa',
    storageBucket: 'el-safa-marwa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFVFx0VjHZkTpEK_q4b27BzEF6ePChYDI',
    appId: '1:266058237320:ios:92e5ffa25f4cc5d3e7263d',
    messagingSenderId: '266058237320',
    projectId: 'el-safa-marwa',
    storageBucket: 'el-safa-marwa.appspot.com',
    iosBundleId: 'com.example.ecommerceElsafaMarwa4',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFVFx0VjHZkTpEK_q4b27BzEF6ePChYDI',
    appId: '1:266058237320:ios:92e5ffa25f4cc5d3e7263d',
    messagingSenderId: '266058237320',
    projectId: 'el-safa-marwa',
    storageBucket: 'el-safa-marwa.appspot.com',
    iosBundleId: 'com.example.ecommerceElsafaMarwa4',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDGlnwSgBXp43kygvnpPNSkLe1CtvwXZp8',
    appId: '1:266058237320:web:8bdf1f643dc44366e7263d',
    messagingSenderId: '266058237320',
    projectId: 'el-safa-marwa',
    authDomain: 'el-safa-marwa.firebaseapp.com',
    storageBucket: 'el-safa-marwa.appspot.com',
  );
}
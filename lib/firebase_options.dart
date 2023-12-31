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
    apiKey: 'AIzaSyAr3PFB92xr3_AJKxKWKf-WRWpRSijr3Rc',
    appId: '1:501055105865:web:4a2f2a3ddd1e0d51d28898',
    messagingSenderId: '501055105865',
    projectId: 'luduschat-9fa7e',
    authDomain: 'luduschat-9fa7e.firebaseapp.com',
    storageBucket: 'luduschat-9fa7e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZyIBqdwU_lbO45V_Jb6ACocZgxjCcSXE',
    appId: '1:501055105865:android:c37833bced9448ffd28898',
    messagingSenderId: '501055105865',
    projectId: 'luduschat-9fa7e',
    storageBucket: 'luduschat-9fa7e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBh1WWYlkG5ExJ2ebv3_kIYu2pA2MO4r1o',
    appId: '1:501055105865:ios:782522537f053b76d28898',
    messagingSenderId: '501055105865',
    projectId: 'luduschat-9fa7e',
    storageBucket: 'luduschat-9fa7e.appspot.com',
    iosBundleId: 'com.example.ludus',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBh1WWYlkG5ExJ2ebv3_kIYu2pA2MO4r1o',
    appId: '1:501055105865:ios:6957b58af0b7eeaed28898',
    messagingSenderId: '501055105865',
    projectId: 'luduschat-9fa7e',
    storageBucket: 'luduschat-9fa7e.appspot.com',
    iosBundleId: 'com.example.ludus.RunnerTests',
  );
}

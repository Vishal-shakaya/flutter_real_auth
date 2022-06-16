// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB6JNDgxmWbqXxBmBMtCwgUhpfFpPj5YQc',
    appId: '1:480549454577:web:f07fae41df204c575d1f50',
    messagingSenderId: '480549454577',
    projectId: 'real-auth-7065121120',
    authDomain: 'real-auth-7065121120.firebaseapp.com',
    storageBucket: 'real-auth-7065121120.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3n6d7BouADefM2GeehaFgwDLYzHxboWc',
    appId: '1:480549454577:android:48c38b6599f33f8a5d1f50',
    messagingSenderId: '480549454577',
    projectId: 'real-auth-7065121120',
    storageBucket: 'real-auth-7065121120.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDk2cRt_5Y4oR7IPZLNJT09WwOAisM1WWA',
    appId: '1:480549454577:ios:b8c5eb6a832358ca5d1f50',
    messagingSenderId: '480549454577',
    projectId: 'real-auth-7065121120',
    storageBucket: 'real-auth-7065121120.appspot.com',
    iosClientId: '480549454577-qsgvmpg93a1girll1dumcqqshkh88cg1.apps.googleusercontent.com',
    iosBundleId: 'shakayavishal.realauth.com',
  );
}
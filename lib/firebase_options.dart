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
    apiKey: 'AIzaSyD80LpLQFky7pnFkDkVKgGdY3gpF0Q71dY',
    appId: '1:675108066038:web:2bcacf2d8048cfc6fa52d7',
    messagingSenderId: '675108066038',
    projectId: 'prokimnas-87b7d',
    authDomain: 'prokimnas-87b7d.firebaseapp.com',
    databaseURL: 'https://prokimnas-87b7d-default-rtdb.firebaseio.com',
    storageBucket: 'prokimnas-87b7d.appspot.com',
    measurementId: 'G-GR3NTKQ9LS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzatbTgZJJo1gpHIochmjR-MD4Pxc6SrA',
    appId: '1:675108066038:android:173aff6c596df492fa52d7',
    messagingSenderId: '675108066038',
    projectId: 'prokimnas-87b7d',
    databaseURL: 'https://prokimnas-87b7d-default-rtdb.firebaseio.com',
    storageBucket: 'prokimnas-87b7d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-GsfHHZwj-oisLt3b2d4X9N3P2u4MYq4',
    appId: '1:675108066038:ios:e91bca10bae90d26fa52d7',
    messagingSenderId: '675108066038',
    projectId: 'prokimnas-87b7d',
    databaseURL: 'https://prokimnas-87b7d-default-rtdb.firebaseio.com',
    storageBucket: 'prokimnas-87b7d.appspot.com',
    iosClientId: '675108066038-q5jfvpo7vllppf34ojdtc5fkdnbrvtpr.apps.googleusercontent.com',
    iosBundleId: 'com.example.incube',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-GsfHHZwj-oisLt3b2d4X9N3P2u4MYq4',
    appId: '1:675108066038:ios:95060e82662ff30cfa52d7',
    messagingSenderId: '675108066038',
    projectId: 'prokimnas-87b7d',
    databaseURL: 'https://prokimnas-87b7d-default-rtdb.firebaseio.com',
    storageBucket: 'prokimnas-87b7d.appspot.com',
    iosClientId: '675108066038-d9j3jk85m5infqbi033g6q9qig2jm20g.apps.googleusercontent.com',
    iosBundleId: 'com.example.incube.RunnerTests',
  );
}

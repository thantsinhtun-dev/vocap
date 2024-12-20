// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_prod.dart';
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
    apiKey: 'AIzaSyB_-mxG60lN8Tj9oNbl8o7F0kpwFv_fyg8',
    appId: '1:762826055064:web:9b160a0299d21c94abdfed',
    messagingSenderId: '762826055064',
    projectId: 'vocap-fb634',
    authDomain: 'vocap-fb634.firebaseapp.com',
    databaseURL: 'https://vocap-fb634-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'vocap-fb634.firebasestorage.app',
    measurementId: 'G-PPZ7R2KMJ3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5MM0yAoIX5Q7wpZTmuGIz28EW7vx4vps',
    appId: '1:762826055064:android:e7f35252e265a64fabdfed',
    messagingSenderId: '762826055064',
    projectId: 'vocap-fb634',
    databaseURL: 'https://vocap-fb634-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'vocap-fb634.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTbKKlNQ3koI9tl2cap8y2EaO2KMY2DUU',
    appId: '1:762826055064:ios:40a549e3faabf596abdfed',
    messagingSenderId: '762826055064',
    projectId: 'vocap-fb634',
    databaseURL: 'https://vocap-fb634-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'vocap-fb634.firebasestorage.app',
    iosClientId: '762826055064-2q2gru5a9lf1nnl3a8s13bfv9fpi1qqe.apps.googleusercontent.com',
    iosBundleId: 'com.stone.vocap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTbKKlNQ3koI9tl2cap8y2EaO2KMY2DUU',
    appId: '1:762826055064:ios:40a549e3faabf596abdfed',
    messagingSenderId: '762826055064',
    projectId: 'vocap-fb634',
    databaseURL: 'https://vocap-fb634-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'vocap-fb634.firebasestorage.app',
    iosClientId: '762826055064-2q2gru5a9lf1nnl3a8s13bfv9fpi1qqe.apps.googleusercontent.com',
    iosBundleId: 'com.stone.vocap',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB_-mxG60lN8Tj9oNbl8o7F0kpwFv_fyg8',
    appId: '1:762826055064:web:ef2b8082df8fd6c8abdfed',
    messagingSenderId: '762826055064',
    projectId: 'vocap-fb634',
    authDomain: 'vocap-fb634.firebaseapp.com',
    databaseURL: 'https://vocap-fb634-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'vocap-fb634.firebasestorage.app',
    measurementId: 'G-79S5JS9DHZ',
  );

}
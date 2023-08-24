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
    apiKey: 'AIzaSyAGrcwJ6LriLnamypNFdk32uh4-tKXpkEQ',
    appId: '1:170690890893:web:ca6e5addaae331dcef66c4',
    messagingSenderId: '170690890893',
    projectId: 'notesapp-9702b',
    authDomain: 'notesapp-9702b.firebaseapp.com',
    storageBucket: 'notesapp-9702b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiUMrpeegw8pUxUVkFt90VkBGUhGLNIYY',
    appId: '1:170690890893:android:21c70240e2b9d11cef66c4',
    messagingSenderId: '170690890893',
    projectId: 'notesapp-9702b',
    storageBucket: 'notesapp-9702b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOp8craXYU4BZmtUkFGjfLPp-BIpd426Y',
    appId: '1:170690890893:ios:dd94a609f342f8aaef66c4',
    messagingSenderId: '170690890893',
    projectId: 'notesapp-9702b',
    storageBucket: 'notesapp-9702b.appspot.com',
    iosClientId: '170690890893-5nb8tuhjouik8v5m6ssll1fpk05pc4hd.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOp8craXYU4BZmtUkFGjfLPp-BIpd426Y',
    appId: '1:170690890893:ios:38c158684b1c2a1eef66c4',
    messagingSenderId: '170690890893',
    projectId: 'notesapp-9702b',
    storageBucket: 'notesapp-9702b.appspot.com',
    iosClientId: '170690890893-h2hi5d3ft9u2187fioci0hgukui2bsrf.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesapp.RunnerTests',
  );
}

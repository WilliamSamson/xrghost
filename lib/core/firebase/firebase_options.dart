import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBJ0GX7Pk2-FvZs7SuoQq0YsQ5Pm3vNimc',
    appId: '1:98124915941:android:a0d6c40d605ee50f2c600c',
    messagingSenderId: 'YOUR_WEB_MESSAGING_SENDER_ID',
    projectId: 'xr-ghost',
    //authDomain: 'YOUR_AUTH_DOMAIN',
    storageBucket: 'xr-ghost.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJ0GX7Pk2-FvZs7SuoQq0YsQ5Pm3vNimc',
    appId: '1:98124915941:android:a0d6c40d605ee50f2c600c',
    messagingSenderId: 'YOUR_ANDROID_MESSAGING_SENDER_ID',
    projectId: 'xr-ghost',
    storageBucket: 'xr-ghost.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: 'YOUR_IOS_APP_ID',
    messagingSenderId: 'YOUR_IOS_MESSAGING_SENDER_ID',
    projectId: 'xr-ghost',
    storageBucket: 'xr-ghost.firebasestorage.app',
    iosBundleId: 'YOUR_IOS_BUNDLE_ID',
  );
}


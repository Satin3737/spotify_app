import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHeFsveu4MoHo2fH8yq9tcUB2vp320O84',
    appId: '1:174428479359:android:2d3667059148ad1642444a',
    messagingSenderId: '174428479359',
    projectId: 'spotify-app-fb374',
    databaseURL:
        'https://spotify-app-fb374-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'spotify-app-fb374.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBe6k9Tz566lRNNdHTG6-juFEoS7MFsfNk',
    appId: '1:174428479359:ios:d67d643810bc443142444a',
    messagingSenderId: '174428479359',
    projectId: 'spotify-app-fb374',
    databaseURL:
        'https://spotify-app-fb374-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'spotify-app-fb374.firebasestorage.app',
    iosBundleId: 'com.example.spotifyApp',
  );
}

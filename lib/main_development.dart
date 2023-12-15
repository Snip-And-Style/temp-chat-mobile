import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:snip_and_style/backbone/dependency_injection.dart' as di;
import 'package:snip_and_style/bootstrap.dart';
import 'package:snip_and_style/presentation/page/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.registerDependencies();
  await dotenv.load();
  await Firebase.initializeApp(
    options: getFirebaseOptions(),
  );
  await bootstrap(App.new);
}

FirebaseOptions getFirebaseOptions() {
  final isAndroid = defaultTargetPlatform == TargetPlatform.android;

  return FirebaseOptions(
    apiKey:
        dotenv.env[isAndroid ? 'ANDROID_API_KEY' : 'IOS_API_KEY'].toString(),
    appId: dotenv.env[isAndroid ? 'ANDROID_APP_ID' : 'IOS_APP_ID'].toString(),
    messagingSenderId: dotenv.env['MESSAGING_SENDER_ID'].toString(),
    projectId: dotenv.env['PROJECT_ID'].toString(),
    storageBucket: dotenv.env['STORAGE_BUCKET'].toString(),
    iosBundleId: isAndroid ? null : dotenv.env['IOS_BUNDLE_ID'].toString(),
  );
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:snip_and_style/backbone/dependency_injection.dart' as di;
import 'package:snip_and_style/bootstrap.dart';
import 'package:snip_and_style/presentation/page/app.dart';

Future<void> main() async {
  // Ensures that Flutter's binding is initialized before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from .env file.
  await dotenv.load();

  // Initialize Hive for Flutter, which is used for local storage by GraphQL.
  await initHiveForFlutter();

  // Set up dependency injection.
  di.registerDependencies();

  // Initialize Firebase with the appropriate options based on the platform.
  await Firebase.initializeApp(
    options: getFirebaseOptions(),
  );

  // Bootstrap the application.
  await bootstrap(App.new);
}

// Determines the appropriate Firebase options based on the platform.
FirebaseOptions getFirebaseOptions() {
  final isAndroid = defaultTargetPlatform == TargetPlatform.android;

  // Fetches the correct Firebase configuration keys from .env
  return FirebaseOptions(
    apiKey: dotenv.env[isAndroid ? 'ANDROID_API_KEY' : 'IOS_API_KEY'] ??
        'default_api_key',
    appId: dotenv.env[isAndroid ? 'ANDROID_APP_ID' : 'IOS_APP_ID'] ??
        'default_app_id',
    messagingSenderId: dotenv.env['MESSAGING_SENDER_ID'] ?? 'default_sender_id',
    projectId: dotenv.env['PROJECT_ID'] ?? 'default_project_id',
    storageBucket: dotenv.env['STORAGE_BUCKET'] ?? 'default_storage_bucket',
    iosBundleId: isAndroid ? null : dotenv.env['IOS_BUNDLE_ID'],
  );
}

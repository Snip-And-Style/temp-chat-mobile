import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:snip_and_style/bootstrap.dart';
import 'package:snip_and_style/presentation/page/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['API_KEY'].toString(),
      appId: dotenv.env['APP_ID'].toString(),
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID'].toString(),
      projectId: dotenv.env['PROJECT_ID'].toString(),
      storageBucket: dotenv.env['STORAGE_BUCKET'].toString(),
    ),
  );
  await bootstrap(App.new);
}

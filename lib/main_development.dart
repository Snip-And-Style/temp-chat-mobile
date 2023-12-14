import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snip_and_style/bootstrap.dart';
import 'package:snip_and_style/firebase_options.dart';
import 'package:snip_and_style/presentation/page/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await bootstrap(App.new);
}

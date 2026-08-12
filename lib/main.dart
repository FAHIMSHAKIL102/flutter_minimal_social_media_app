import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minimal_social_media_app/auth/auth_page.dart';
import 'package:flutter_minimal_social_media_app/feature/theme/dark_mode.dart';
import 'package:flutter_minimal_social_media_app/feature/theme/light_mode.dart';
import 'package:flutter_minimal_social_media_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}

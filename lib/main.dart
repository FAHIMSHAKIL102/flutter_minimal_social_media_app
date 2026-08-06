import 'package:flutter/material.dart';
import 'package:flutter_minimal_social_media_app/feature/pages/login_page.dart';
import 'package:flutter_minimal_social_media_app/feature/pages/register_page.dart';
import 'package:flutter_minimal_social_media_app/feature/theme/dark_mode.dart';
import 'package:flutter_minimal_social_media_app/feature/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}

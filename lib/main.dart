import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minimal_social_media_app/auth/auth_page.dart';
import 'package:flutter_minimal_social_media_app/auth/login_or_register.dart';
import 'package:flutter_minimal_social_media_app/feature/pages/home_page.dart';
import 'package:flutter_minimal_social_media_app/feature/pages/login_page.dart';
import 'package:flutter_minimal_social_media_app/feature/pages/profile_page.dart';
import 'package:flutter_minimal_social_media_app/feature/pages/register_page.dart';
import 'package:flutter_minimal_social_media_app/feature/pages/user_page.dart';
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
      routes: {
        '/login_page':(context) => LoginPage(),
        '/register_page': (context) => RegisterPage(),
        '/login_register_page': (context) => LoginOrRegister(),
        '/home_page':(context) => HomePage(),
        '/profile_page':(context) => ProfilePage(),
        '/user_page': (context) => UserPage(),
      },
    );
  }
}

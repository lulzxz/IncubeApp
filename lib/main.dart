import 'package:flutter/material.dart';
import 'package:incube/pages/Login.dart';
import 'package:incube/pages/Profile.dart';
import 'package:incube/pages/Register.dart';
import 'package:incube/pages/Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:incube/pages/Navbar.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final onboarding = prefs.getBool("onboarding") ?? false;
  runApp(MyApp(onboarding: onboarding));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({Key? key, required this.onboarding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onboarding ?  Screen() :  Splash(),
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/home': (context) => const BotNav(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:onboarding_screen/firebase_options.dart';
import 'package:onboarding_screen/pages/auth_page.dart';
import 'package:onboarding_screen/screens/onboarding_screen.dart';
import 'package:onboarding_screen/sign_in/sign_in.dart'; 
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

// flutter pub add google_fonts = to install font from google

// ignore: non_constant_identifier_names
 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'On boarding Screen',
      theme: ThemeData.light(useMaterial3: true),
      // home: const OnBoardingScreen(),
      // home: SignInScreen(),
      home: const AuthPage(),
    );
  }
}
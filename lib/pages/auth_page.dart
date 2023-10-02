import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/onboarding_screen.dart';
import 'package:onboarding_screen/sign_in/sign_in.dart';
import 'package:onboarding_screen/sign_up/sign_up.dart';
import 'home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            // user is logged in
            if (snapshot.hasData) {
              return HomePage();
              // return OnBoardingScreen();
            }
            // user is NOT logged in
            else {
              return SignInScreen();
            }
          }
        },
      ),
    );
  }
}

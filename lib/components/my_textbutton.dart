import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/pages/home_page.dart';
import 'package:onboarding_screen/pages/reset_password.dart';
import 'package:onboarding_screen/sign_in/sign_in.dart';
import 'package:onboarding_screen/sign_up/sign_up.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton(
      {super.key, required this.lableText, required this.pageRoute});

  final String lableText;
  final String pageRoute;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            if (pageRoute == 'register') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            } 
            else if (pageRoute == 'login') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            } 
            else if (pageRoute == 'reset_password') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
              );
            }
            
            else if (pageRoute == 'home') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } 
          },
          child: Text(
            lableText,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displaySmall,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:onboarding_screen/components/my_button.dart";
import "package:onboarding_screen/components/my_iconbutton.dart";
import "package:onboarding_screen/components/my_textbutton.dart";
import "package:onboarding_screen/components/my_textfield.dart";

class SignInScreen extends StatefulWidget {
  SignInScreen({
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in
  Future signInUser() async {
    if (emailController.text != "" && passwordController.text != "") {
      print('Thanks You :)');
    } else {
      alertdMessage();
      print('Please input your credential');
    }
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'invalid-email') {
        // show error to user
        wrongEmailMessage();
        print("No user found for that email.");
        print(e.code);
      }

      // WRONG PASSWORD
      else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        // show error to user
        print(e.code);
        wrongPasswordMessage();
      }
      // email is already in use
    }
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Email',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Incorrect Password',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // wrong password message popup
  void alertdMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              'Enter your credientail',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Form(
            child: Column(
              children: [
                Text(
                  "Hello, ready to get started?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Please sign in with your email and password.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  textController: emailController,
                  label: 'Email',
                  hindText: 'Enter your email',
                  obscureText: false,
                ),
                MyTextField(
                  textController: passwordController,
                  label: 'Password',
                  hindText: 'Enter your password',
                  obscureText: true,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: MyTextButton(
                    lableText: 'Forget password?',
                    pageRoute: 'reset_password',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(onTap: signInUser, labelButton: 'Sign In'),

                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Or continue with'),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),

                // Icon buttom
                const SizedBox(
                  height: 0,
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIconButton(imagePath: 'assets/icons/google.png'),
                      SizedBox(
                        width: 20,
                      ),
                      MyIconButton(imagePath: 'assets/icons/apple.png'),
                    ],
                  ),
                ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member ?'),
                      MyTextButton(
                        lableText: 'Register now',
                        pageRoute: 'register',
                      )
                    ],
                  ),
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

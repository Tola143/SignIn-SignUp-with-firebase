import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/screens/on_boarding.dart';
import 'package:onboarding_screen/todo_list/toDoList.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text(
          'Task management.',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: signUserOut,
              icon: const Icon(Icons.logout),
              color: Colors.white)
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const ToDoList();
          },
          itemCount: 5,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}

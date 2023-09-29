import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    // ignore: non_constant_identifier_names
    required this.textController,
    required this.label,
    required this.hindText,
    required this.obscureText,
  });

  // ignore: non_constant_identifier_names
  final TextEditingController textController;
  final String label;
  final String hindText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextField(
        controller: textController,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hindText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blue),
            gapPadding: 10,
          ),
        ),
      ),
    );
  }
}

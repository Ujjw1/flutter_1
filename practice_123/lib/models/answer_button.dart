import 'package:flutter/material.dart';

// ignore: camel_case_types
class Answer_Button extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const Answer_Button(
      // ignore: non_constant_identifier_names
      {required this.Answertext,
      required this.onTap,
      super.key});

  // ignore: non_constant_identifier_names
  final String Answertext;
  // ignore: prefer_typing_uninitialized_variables
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 27, 3, 124),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        Answertext,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

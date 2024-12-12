import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Logbutton extends StatelessWidget {
  Logbutton({required this.text, required this.onPressed, super.key});

  String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}

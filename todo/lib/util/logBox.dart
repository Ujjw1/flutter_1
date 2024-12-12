import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:todo/util/logbutton.dart';

// ignore: must_be_immutable
class Logbox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onchangeseved;
  VoidCallback onchangecancel;
  Logbox(
      {required this.onchangecancel,
      required this.onchangeseved,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter the task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Logbutton(
                  text: 'Seved',
                  onPressed: onchangeseved,
                ),
                const SizedBox(
                  width: 10,
                ),
                Logbutton(text: 'Cancel', onPressed: onchangecancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}

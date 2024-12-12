import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final String iconPath;
  final String bottontext;
  const MyWidget({required this.iconPath, required this.bottontext, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 40,
                spreadRadius: 10,
              )
            ],
          ),
          child: Center(
            child: Image.asset(iconPath),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          bottontext,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700]),
        ),
      ],
    );
  }
}

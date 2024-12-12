import 'package:flutter/material.dart';

class emostion extends StatelessWidget {
  final String emostionFace;
  const emostion({super.key, required this.emostionFace});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Text(
        emostionFace,
        style: TextStyle(fontSize: 28, color: Colors.yellow),
      ),
    );
  }
}

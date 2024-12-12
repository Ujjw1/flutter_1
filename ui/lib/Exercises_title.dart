// ignore: file_names
import 'package:flutter/material.dart';

class Exercises extends StatelessWidget {
  final IconData icon;
  final String exercises;
  final int numberOfExercises;

  // ignore: use_key_in_widget_constructors
  const Exercises({
    required this.icon,
    required this.exercises,
    required this.numberOfExercises,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                  ),
                  child: Icon(icon, color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercises,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '$numberOfExercises',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}

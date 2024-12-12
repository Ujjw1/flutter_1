// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'Assest/quiz-logo.png', // Corrected asset path
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          const Text(
            'Learn Flutter',
            style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 237, 223, 252),
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor:
                  Colors.white, // Changed foregroundColor to primary
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}

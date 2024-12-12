// ignore: unused_import
import 'dart:js_interop';

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:practice_123/models/ques.dart';
import 'package:practice_123/models/question_summary.dart';

// ignore: camel_case_types
class Result_Screen extends StatelessWidget {
  const Result_Screen({super.key, required this.choiceAnswer});

  final List<String> choiceAnswer;

  List<Map<String, Object>> getSummerData() {
    final List<Map<String, Object>> summery = [];

    for (var i = 0; i < choiceAnswer.length; i++) {
      summery.add(
        {
          'question-index': i,
          'question': questions[i].text,
          'correct-answer': questions[i].answer[0],
          'user-answer': choiceAnswer[i],
        },
      );
    }
    return summery;
  }

  @override
  Widget build(context) {
    // ignore: non_constant_identifier_names
    final summary_datas = getSummerData();
    final numquestion = questions.length;
    final numcorrectquestions = summary_datas.where((data) {
      return data['user-answer'] == data['correct-answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // ignore: unnecessary_const
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answer $numcorrectquestions out of $numquestion Question correctly!',
              style: const TextStyle(color: Colors.white),
            ),
            question_sumrray(summary_datas),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}

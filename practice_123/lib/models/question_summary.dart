import 'package:flutter/material.dart';

// ignore: unused_import

// ignore: camel_case_types
class question_sumrray extends StatelessWidget {
  const question_sumrray(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Text(
                    ((data['question-index'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(data['user-answer'] as String,
                            style: const TextStyle(color: Colors.white)),
                        Text(
                          data['correct-answer'] as String,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

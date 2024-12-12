import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:practice_123/quiz.dart';
// ignore: unused_import
import 'package:practice_123/models/answer_button.dart';
// ignore: unused_import
import 'package:practice_123/models/ques.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  final void Function(String answer) onSelectedAnswer;

  // ignore: no_logic_in_create_state
  @override
  State<QuestionScreen> createState() {
    // ignore: no_logic_in_create_state
    return _QuestionScreenState();
  }
}

@override
class _QuestionScreenState extends State<QuestionScreen> {
  var currentquestionindex = 0;

  void answerquestion(String selectedanswer) {
    widget.onSelectedAnswer(selectedanswer);
    setState(() {
      currentquestionindex++;
    });
  }

  @override
  Widget build(context) {
    // ignore: unused_local_variable
    final currentquestion = questions[currentquestionindex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentquestion.suflelist.map((answers) {
              return Column(
                children: [
                  Answer_Button(
                      Answertext: answers,
                      onTap: () {
                        answerquestion(answers);
                      }),
                  const SizedBox(height: 20),
                ],
              );
              // ignore: unnecessary_to_list_in_spreads
            })
          ],
        ),
      ),
    );
  }
}

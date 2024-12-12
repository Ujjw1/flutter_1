import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'start_screen.dart';
import 'question.dart';
import 'package:practice_123/models/ques.dart';
// ignore: unused_import
import 'package:practice_123/models/result_secreen.dart';

// ignore: camel_case_types
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _quizState();
  }
}

// ignore: camel_case_types
class _quizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'star-secreen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void choiseAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // ignore: unrelated_type_equality_checks

        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionScreen('');

    // ignore: unused_local_variable
    Widget screenWidge = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidge = QuestionScreen(
        onSelectedAnswer: choiseAnswers,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidge = Result_Screen(
        choiceAnswer: selectedAnswers,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          // ignore: unnecessary_const
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
          ),

          // ignore: unnecessary_const
          child: screenWidge,
        ),
      ),
    );
  }
}

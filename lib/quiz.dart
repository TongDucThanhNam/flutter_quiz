import "package:flutter/material.dart";
import "package:flutter_quiz/question_screen.dart";
import "package:flutter_quiz/result_screen.dart";
import "package:flutter_quiz/start_screen.dart";

import "data/quiz_question_data.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  var currentScreen;
  List<String> selectedAnswer = [];

  @override
  void initState() {
    currentScreen = "start-screen";
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    debugPrint("Selected answer: ${selectedAnswer.length}");
    if (selectedAnswer.length == quizQuestions.length) {
      setState(() {
        currentScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    selectedAnswer = [];
    setState(() {
      //Switch Screen
      currentScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    debugPrint('currentScreen: $currentScreen');

    if (currentScreen == "question-screen") {
      screenWidget = QuestionScreen(
        selectedAnswer: chooseAnswer,
      );
    }

    if (currentScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswer,
          switchScreen: switchScreen,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 134, 43, 205),
              Color.fromARGB(255, 88, 3, 132),
            ], begin: Alignment.topLeft, end: Alignment.centerRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

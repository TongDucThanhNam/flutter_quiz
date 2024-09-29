import "package:flutter/material.dart";
import "package:flutter_quiz/data/quiz_question_data.dart";
import "package:google_fonts/google_fonts.dart";

import "models/option_button.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.selectedAnswer});

  final void Function(String answer) selectedAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.selectedAnswer(answer);
    setState(() {
      // if (currentQuestionIndex < quizQuestions.length - 1) {
      currentQuestionIndex += 1;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(quizQuestions[currentQuestionIndex].question,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 20,
              ),
              ...quizQuestions[currentQuestionIndex].options.map((option) {
                return OptionButton(
                    optionText: option,
                    onTap: () {
                      answerQuestion(option);
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

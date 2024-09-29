import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/quiz_question_data.dart';
import 'package:flutter_quiz/question_sumary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.switchScreen});

  final List<String> chosenAnswers;
  final void Function() switchScreen;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var quiz in chosenAnswers.asMap().entries) {
      summary.add({
        'question_index': quiz.key,
        'question': quizQuestions[quiz.key].question,
        'correct_answer':
            quizQuestions[quiz.key].options[quizQuestions[quiz.key].answer],
        'user_answer': chosenAnswers[quiz.key]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = quizQuestions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $numCorrectQuestions out of $numTotalQuestions question correctly !"),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              label: const Text("Restart Quiz"),
              icon: const Icon(Icons.refresh),
              onPressed: () => {
                switchScreen()
              },
            )
          ],
        ),
      ),
    );
  }
}

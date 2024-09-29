import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return ListTile(
              title: Text(data['question'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              leading: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: data['user_answer'] == data['correct_answer']
                      ? Colors.green
                      : Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your answer: ${data['user_answer']}', style: const TextStyle(color: Colors.blueAccent)),
                  Text('Correct answer: ${data['correct_answer']}', style: const TextStyle(color: Colors.green)),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

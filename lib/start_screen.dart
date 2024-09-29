import "package:flutter/material.dart";

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset(
              "assets/images/quiz-logo.png",
              height: 300,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Flutter quiz app",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            label: const Text("Next"),
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: () => {startQuiz()},
          )
        ],
      ),
    );
  }
}

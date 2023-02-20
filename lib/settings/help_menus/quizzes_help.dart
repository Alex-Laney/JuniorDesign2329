import 'package:flutter/material.dart';

class QuizzesHelpScreen extends StatelessWidget {
  const QuizzesHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes Help'),
      ),
      body: Center(
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                text: '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

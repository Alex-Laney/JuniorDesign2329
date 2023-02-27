import 'package:flutter/material.dart';

class QuizzesHelpScreen extends StatelessWidget {
  const QuizzesHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
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

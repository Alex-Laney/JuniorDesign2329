import 'package:artifact/Quizzes/quiz.dart';
import 'package:flutter/material.dart';
import 'package:artifact/circular_dial_menu.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> answers;
  final Quiz quiz;

  const ResultsScreen({required this.answers, required this.quiz, super.key});

  @override
  Widget build(BuildContext context) {
    int score = 0;
    List<int> wrongQuestions = [];
    for (int i = 0; i < quiz.questionList.length; i++) {
      if (answers[i] == quiz.questionList[i].correctAnswer) {
        score += 1;
      } else {
        wrongQuestions.add(i);
      }
    }
    List<Widget> wrongQuestionsDisplay = [];
    for (int i = 0; i < wrongQuestions.length; i++) {
      wrongQuestionsDisplay.add(Text(quiz.questionList[wrongQuestions[i]].question));
      wrongQuestionsDisplay.add(SizedBox(height: 20));
    }

    List<Widget> disp = [
      const SizedBox(height: 28),
      Text(quiz.name, style: const TextStyle(fontSize: 40)),
      const SizedBox(height: 20),
      Text("Score: " + score.toString() + "/" + quiz.questionList.length.toString(),
      style: const TextStyle(fontSize: 30),
      ),
      const SizedBox(height: 20),
      Text("Questions to review:", style: const TextStyle(fontSize: 20)),
      const SizedBox(height: 20),
    ];

    disp.addAll(wrongQuestionsDisplay);

    return Scaffold(
        backgroundColor: const Color.fromRGBO(225, 255, 195, 1),
        body: Container(
          margin: const EdgeInsets.all(24),
          alignment: Alignment.topCenter,
            child: Column(mainAxisSize: MainAxisSize.min,
                children: disp
            )
        ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              tooltip: 'Home',
              icon: const Icon(Icons.home, color: Colors.black45),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              tooltip: 'Settings',
              icon: const Icon(Icons.settings, color: Colors.black45),
            ),
          ],
        ),
      ),

    );
  }
}
import 'package:artifact/Quizzes/quiz.dart';
import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:artifact/hive_local_data/quiz_result/quiz_result_db.dart';
import 'package:artifact/hive_local_data/rewards/rewards_points_db.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> answers;
  final Quiz quiz;
  final _resultsDatabase = QuizResultDatabase();
  final _rewardsDatabase = RewardPointsDatabase();

  ResultsScreen({required this.answers, required this.quiz, super.key});

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
      wrongQuestionsDisplay.add(
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
              foregroundColor: Color.fromRGBO(0, 0, 0, 1.0),
              side: BorderSide(width: 5.0, color: Color.fromRGBO(194, 232, 139, 1.0)),
              elevation: 5,
              //fixedSize: Size:,
            ),
            onPressed: () => Navigator.pushNamed(context, '/main'),
            child: Text(quiz.questionList[wrongQuestions[i]].question, style: TextStyle(fontSize: 20, color: Colors.black), textAlign: TextAlign.center)
          )
      );
      wrongQuestionsDisplay.add(SizedBox(height: 10));
    }

    List<Widget> disp = [
      const SizedBox(height: 28),
      Text(
        quiz.name,
        style: const TextStyle(fontSize: 40),
      ),
      const SizedBox(height: 20),
      Text(
        "Score: " +
            score.toString() +
            "/" +
            quiz.questionList.length.toString(),
        style: const TextStyle(fontSize: 30),
      ),
      const SizedBox(height: 20),
      Text(
        "Questions to review:",
        style: const TextStyle(fontSize: 20),
      ),
      const SizedBox(height: 20),
    ];

    disp.addAll(wrongQuestionsDisplay);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(225, 255, 195, 1),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          alignment: Alignment.topCenter,
          child: Column(mainAxisSize: MainAxisSize.min, children: disp),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}

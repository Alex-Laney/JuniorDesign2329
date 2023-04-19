import 'package:artifact/Quizzes/quiz.dart';
import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:artifact/main.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> answers;
  final Quiz quiz;

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

    /// Update rewards points
    _updateRewardsPoints(score);

    List<Widget> wrongQuestionsDisplay = [];
    for (int i = 0; i < wrongQuestions.length; i++) {
      wrongQuestionsDisplay.add(
        Text(quiz.questionList[wrongQuestions[i]].question),
      );
      wrongQuestionsDisplay.add(
        SizedBox(height: 20),
      );
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

  /// Updates rewards points based on quiz score
  void _updateRewardsPoints(int score) {
    // Get the highest score so far on quiz.
    int previousHighScore = quizResultsData.getQuizResultList(quiz.name)[0][1];
    if (score > previousHighScore) {
      rewardPointsData.rewardPoints += score - previousHighScore;
      rewardPointsData.updateData();
    }
  }
}

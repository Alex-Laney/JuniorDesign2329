import 'package:artifact/Quizzes/quiz.dart';
import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:artifact/hive_local_data/quiz_result/quiz_result_db.dart';
import 'package:artifact/hive_local_data/rewards/rewards_points_db.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';
import 'package:hive/hive.dart';

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
      getScore(score),
      const SizedBox(height: 20),
      Text(
        "Questions to review:",
        style: const TextStyle(fontSize: 20),
      ),
      const SizedBox(height: 20),
    ];

    disp.addAll(wrongQuestionsDisplay);

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(225, 255, 195, 1),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(24),
              alignment: Alignment.topCenter,
              child: Column(mainAxisSize: MainAxisSize.min, children: disp),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CircularDialMenu.build(context),
          bottomNavigationBar: BottomButtonBar.build(context),
        ));
  }

  Text getScore(int score) {
    Box box = Hive.box('userBox');
    List results = _resultsDatabase.getQuizResultList(quiz.name);
    int i;
    int max = results[0][1];
    for (i = 0; i < 5; i++) {
      if (results[i][1] < score) {
        break;
      }
    }
    for (int j = 4; j > i; j--) {
      results[j] = results[j - 1];
    }
    if (i < 5) {
      results[i] = ["New Name", score];
    }
    _resultsDatabase.resultList = results;
    box.put(quiz.name, results);

    if (max < score) {
      if (box.get("REWARDPOINTS") == null) {
        box.put("REWARDPOINTS", score - max);
      } else {
        int rpoints = box.get("REWARDPOINTS");
        rpoints += score - max;
        box.put("REWARDPOINTS", rpoints);
      }
      if (score - max == 1) {
        return Text(
          "Score: " +
              score.toString() +
              "/" +
              quiz.questionList.length.toString() +
              "\nYou earned a Reward Point!",
          style: const TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        );
      } else {
        return Text(
          "Score: " +
              score.toString() +
              "/" +
              quiz.questionList.length.toString() +
              "\nYou earned " +
              (score - max).toString() +
              " Reward Points!",
          style: const TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        );
      }
    }
    return Text(
      "Score: " + score.toString() + "/" + quiz.questionList.length.toString(),
      style: const TextStyle(fontSize: 30),
      textAlign: TextAlign.center,
    );
  }
}

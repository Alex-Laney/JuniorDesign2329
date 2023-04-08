import 'package:artifact/Quizzes/QuestionSemantics/quiz_question.dart';
import 'package:artifact/Quizzes/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

import 'QuestionSemantics/quiz_question.dart';

class Quiz {
  String name;
  String desc;
  List<QuizQuestion> questionList;
  int score = 0;
  int nextInd = 0;

  Quiz({
    required this.name,
    required this.desc,
    required this.questionList,
  });

  TextButton menuView(context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey[100])),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StartScreen(quiz: this)),
        );
      },
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(name, style: const TextStyle(color: Colors.black)),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
                'ScorePlaceholder'), //Maybe style it to different colors based on x/x, 0/x, or something inbetween?
          ),
        )
      ]),
    );
  }
}

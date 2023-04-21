import 'package:artifact/Quizzes/QuestionSemantics/quiz_question.dart';
import 'package:artifact/Quizzes/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';
import '../hive_local_data/quiz_result/quiz_result_db.dart';


import 'QuestionSemantics/quiz_question.dart';

class Quiz {
  String name;
  String desc;
  List<QuizQuestion> questionList;
  int score = 0;
  int nextInd = 0;
  final _resultsDatabase = QuizResultDatabase();

  Quiz({
    required this.name,
    required this.desc,
    required this.questionList,
  });

  OutlinedButton menuView(context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        foregroundColor: Color.fromRGBO(0, 0, 0, 1.0),
        side: BorderSide(width: 5.0, color: Color.fromRGBO(194, 232, 139, 1.0)),
        elevation: 5,
      ),
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
            child: Text(name, style: const TextStyle(color: Colors.black, fontSize: 50, )),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: getHS(), //Maybe style it to different colors based on x/x, 0/x, or something inbetween?
          ),
        )
      ]),
    );
  }

  Text getHS() {
    Color color;
    int HS = _resultsDatabase.getQuizResultList(name)[0][1];
    int numQ = questionList.length;
    double score = HS / numQ;
    if (score < 0.5) {
      color = Colors.redAccent;
    } else if (score < 1) {
      color = Colors.yellowAccent;
    } else {
      color = Colors.green;
    }
    return Text(HS.toString() + "/" + numQ.toString(), style: TextStyle(color: color));
  }
}

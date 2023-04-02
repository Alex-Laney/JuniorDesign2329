import 'package:artifact/Quizzes/Quizzes/quiz_questionsDB.dart';
import 'package:flutter/cupertino.dart';
import '../QuestionSemantics/question_screen.dart';

import '../quiz.dart';

class QuizDB {

  //Copy and Pasteable init Template for each quiz
  static Quiz quiz1 = Quiz(
        name: 'Quiz1', //Change this for each quiz
        desc: 'PlaceholderDesc', //Change this for each quiz
        questionList: QuestionsDB.quiz1Questions()  //Change this for each quiz
      );



  static Widget? getQuestion(Quiz quiz, int qNum, BuildContext context, Function onPressed) {
    if (qNum >= quiz.questionList.length) {
      return null;
    }
    return quiz.questionList[qNum].display(quiz: quiz, qNum: qNum, context: context, onPressed: onPressed);
  }
}
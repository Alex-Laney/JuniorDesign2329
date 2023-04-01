
import 'package:artifact/Quizzes/QuestionSemantics/question_screen.dart';
import 'package:flutter/material.dart';
import '../quiz.dart';

abstract class QuizQuestion {

  Widget display({required Quiz quiz, int qNum = 0, required BuildContext context, required Function onPressed});
}
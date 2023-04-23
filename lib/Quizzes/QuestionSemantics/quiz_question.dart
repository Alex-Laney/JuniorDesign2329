import 'package:flutter/material.dart';
import '../quiz.dart';

abstract class QuizQuestion {
  late String correctAnswer;
  late String question;
  Widget display(
      {required Quiz quiz,
      int qNum = 0,
      required BuildContext context,
      required Function onPressed});
}

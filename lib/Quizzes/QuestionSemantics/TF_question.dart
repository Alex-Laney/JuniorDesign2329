import 'package:artifact/Quizzes/QuestionSemantics/quiz_question.dart';
import 'package:artifact/Quizzes/quiz.dart';
import 'package:flutter/material.dart';

class TFQuestion extends QuizQuestion {
  String question;
  String correctAnswer;

  TFQuestion({
    required this.question,
    required this.correctAnswer,
  });

  static OutlinedButton getButton(String text, Function onPressed) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        foregroundColor: Color.fromRGBO(0, 0, 0, 1.0),
        side: BorderSide(width: 5.0, color: Color.fromRGBO(194, 232, 139, 1.0)),
        elevation: 5,
        //fixedSize: Size:,
      ),
      onPressed: () => {onPressed(text)},
      child: Text(
        text,
        style: TextStyle(fontSize: 30, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget display({
    required Quiz quiz,
    int qNum = 0,
    required BuildContext context,
    required Function onPressed,
  }) {
    List<String> questions = ['True', 'False'];
    List<Widget> answerButtons = [];
    for (int i = 0; i < questions.length; i++) {
      answerButtons.add(getButton(questions[i], onPressed));
    }

    return Column(
      children: <Widget>[
        Center(
          //child: Padding(
          //padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Question ${qNum + 1}${'/'}${quiz.questionList.length}',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Text(
                question,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                itemCount: answerButtons.length,
                itemBuilder: (context, position) {
                  return answerButtons[position];
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

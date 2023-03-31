import 'package:artifact/Quizzes/QuestionSemantics/quiz_question.dart';
import 'package:artifact/Quizzes/quiz.dart';
import 'package:flutter/material.dart';


class TFQuestion extends QuizQuestion {
  String question;
  String correctAnswer;

  TFQuestion({required this.question,
    required this.correctAnswer,});

  static TextButton getButton(String text, Function onPressed) {
    return TextButton(
      onPressed: () => {
        onPressed(text)
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey[100])),
      child: Text(text, style: const TextStyle(color: Colors.black)),
    );
  }

  @override
  Widget display({required Quiz quiz,
    int qNum = 0,
    required BuildContext context,
    required Function onPressed,}) {
    List<String> questions = ['True', 'False'];
    List<Widget> answerButtons = [];
    for (int i = 0; i < questions.length; i++) {
      answerButtons.add(getButton(
          questions[i], onPressed
      ));
    }

    return Column(
      children: <Widget>[
        Center(
          //child: Padding(
          //padding: const EdgeInsets.all(40),
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      'Question ${qNum + 1}${'/'}${quiz.questionList.length}')),
            ),
            Text(question, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                itemCount: answerButtons.length,
                itemBuilder: (context, position) {
                  return answerButtons[position];
                }),
          ]),
        ),
        //)
      ],
    );
  }
}

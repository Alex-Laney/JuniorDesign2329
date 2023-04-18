import 'package:artifact/Quizzes/Results.dart';
import 'package:flutter/material.dart';
import '../quiz.dart';

class QuestionScreen extends StatelessWidget {
  final Quiz quiz;

  const QuestionScreen({required this.quiz, super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(225, 255, 195, 1),
            body: SafeArea(
                child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(quiz.name, style: const TextStyle(fontSize: 40)),
                          const SizedBox(height: 20),
                          QuestionWidget(quiz: quiz),
                        ])))));
  }
}

class QuestionWidget extends StatefulWidget {
  final Quiz quiz;

  const QuestionWidget({required this.quiz, super.key});

  @override
  QuestionState createState() => QuestionState();
}

class QuestionState extends State<QuestionWidget> {
  int qNum = 0;
  List<String> answers = [];

  @override
  Widget build(BuildContext context) {
    Function onPressed;
    if (qNum < widget.quiz.questionList.length - 1) {
      onPressed = nextQ;
    } else {
      onPressed = results;
    }
    return widget.quiz.questionList[qNum].display(
        quiz: widget.quiz, qNum: qNum, context: context, onPressed: onPressed);
  }

  void results(String answer) {
    answers.add(answer);
    print(answers);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ResultsScreen(answers: answers, quiz: widget.quiz)));
    //ADD MOVING TO RESULTS SCREEN HERE, BE SURE TO BRING ANSWERS WITH YOU
  }

  void nextQ(String answer) {
    setState(() {
      qNum += 1;
      answers.add(answer);
    });
  }
}

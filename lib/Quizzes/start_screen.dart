import 'package:artifact/Quizzes/quiz.dart';
import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';
import 'package:artifact/Musical-Terms/Term.dart';
import '../main.dart';
import 'QuestionSemantics/question_screen.dart';
import 'Quizzes/quizDB.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(225, 255, 195, 1),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Text(quiz.name, style: const TextStyle(fontSize: 75)),
                  const SizedBox(height: 20),
                  Text("Topic: " + quiz.desc, style: const TextStyle(fontSize: 30)),
                  const SizedBox(height: 20),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
                          foregroundColor: Color.fromRGBO(0, 0, 0, 1.0),
                          side: BorderSide(width: 5.0, color: Color.fromRGBO(194, 232, 139, 1.0)),
                          elevation: 5,
                          //fixedSize: Size:,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QuestionScreen(quiz: quiz)),
                          );
                        },
                        child: Text('Start!', style: TextStyle(fontSize: 100, color: Colors.black)),
                      ),
                ]),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}

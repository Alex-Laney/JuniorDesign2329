import 'package:artifact/Quizzes/quiz.dart';
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
                  Text(quiz.name, style: const TextStyle(fontSize: 40)),
                  const SizedBox(height: 20),
                  Text(quiz.desc, style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 20),
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[600])),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionScreen(quiz: quiz)),
                      );
                    },
                    child: const Text('Start!',
                        style: TextStyle(color: Colors.black, fontSize: 30)),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen())),
              tooltip: 'Home',
              icon: const Icon(Icons.home, color: Colors.black45),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              tooltip: 'Settings',
              icon: const Icon(Icons.settings, color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}

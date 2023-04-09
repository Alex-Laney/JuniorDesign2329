import 'package:flutter/material.dart';
import 'package:artifact/circular_dial_menu.dart';

import 'Quizzes/quizDB.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(225, 255, 195, 1),
      body: SingleChildScrollView(
          child: SafeArea(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),
              Center(
                  child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: <Widget>[
                          const Text('Quizzes', style: TextStyle(fontSize: 60)),
                          const SizedBox(height: 30),
                          QuizDB.quiz1.menuView(context),
                          const SizedBox(height: 30),
                          QuizDB.quiz2.menuView(context),
                          //ADD OTHER QUIZZES HERE LIKE SO
                        ],
                      )))
            ]),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/main'),
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

import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

import 'Quizzes/quizDB.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(225, 255, 195, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          width: 5000,
                          color: Color.fromARGB(255, 255, 255, 255),
                          padding: const EdgeInsets.all(8),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/rewardScreen');
                            },
                            child: const Text(
                              'Rewards',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const Text('Quizzes', style: TextStyle(fontSize: 40)),
                      const SizedBox(height: 30),
                      QuizDB.quiz1.menuView(context),
                      QuizDB.quiz2.menuView(context),
                      //ADD OTHER QUIZZES HERE LIKE SO
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}

import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:artifact/main.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

import '../common_ui_components/default_app_bar.dart';
import 'Quizzes/quizDB.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar.build(context),
      backgroundColor: const Color.fromRGBO(225, 255, 195, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.all(8),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/rewardGallery');
                              },
                              child: Text(
                                'See Rewards\nPoints: ' +
                                    rewardPointsData
                                        .getRewardPoints()
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 50,
                                  color: Colors.black,
                                ),
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
                          child: Text(
                            'Quizzes',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                        const SizedBox(height: 30),
                        QuizDB.quiz1.menuView(context),
                        const SizedBox(height: 30),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}

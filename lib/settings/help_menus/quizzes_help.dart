import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

import '../../circular_dial_menu.dart';

class QuizzesHelpScreen extends StatelessWidget {
  const QuizzesHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      body: SafeArea(
          child: Column(children: <Widget>[
        const Align(
          alignment: Alignment.topLeft,
          child: BackButton(),
        ),
        Center(
          child: Column(children: <Widget>[
            const Text('Quizzes Help', style: TextStyle(fontSize: 40)),
            Padding(
                padding: const EdgeInsets.all(40),
                child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        text:
                            'The Quizzes page, which you can access with the ',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        children: <InlineSpan>[
                          WidgetSpan(
                            child: CircularMenuItem(
                              padding: 5,
                              margin: 0,
                              badgeRadius: 10,
                              iconSize: 10,
                              boxShadow: const [],
                              color: Colors.green[300],
                              icon: Icons.quiz,
                              iconColor: Colors.black,
                              onTap: () =>
                                  Navigator.pushNamed(context, '/quizzes'),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  ' icon from the menu at the bottom of the screen, or from the main menu, is where you can test what you\'ve learned. Some quizzes might require you to do your own research outside of the app. Have fun, and try to get the highest score!'),
                            ])))
              ]),
            )
          ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false),
              tooltip: 'Home',
              icon: const Icon(Icons.home, color: Colors.black45),
            ),
            IconButton(
              onPressed: () {},
              tooltip: 'Settings',
              icon: const Icon(Icons.settings, color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}

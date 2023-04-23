import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

import '../../bottom_navigation_bar/circular_dial_menu.dart';

const int iconColor = 300;

class WorksHelpScreen extends StatelessWidget {
  const WorksHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  const Text(
                    'Musical Works Help',
                    style: TextStyle(fontSize: 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: 'The Musical Works page, which you can access '
                            'with the ',
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
                              color: Colors.blue[iconColor],
                              icon: Icons.music_note,
                              iconColor: Colors.black,
                              onTap: () =>
                                  Navigator.pushNamed(context, '/works'),
                            ),
                          ),
                          const TextSpan(
                            text: ' icon from the menu at the bottom of the '
                                'screen, or from the main menu, is where '
                                'you can find the different songs in the '
                                'app! Tap on any of their names to be '
                                'taken to their page, where you can read '
                                'up about the stories of their creations, '
                                'and learn about how those older musical '
                                'works compare to modern ones! Also, if '
                                'you see any',
                          ),
                          const TextSpan(
                            text: ' blue ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.lightBlue,
                            ),
                          ),
                          const TextSpan(
                            text: 'words that you don\'t recognize, click on '
                                'them and you will be brought to a page '
                                'explaining what they mean!',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}

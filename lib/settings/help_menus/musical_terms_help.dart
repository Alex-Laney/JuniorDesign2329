import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

import '../../circular_dial_menu.dart';

class MusicalTermsHelpScreen extends StatelessWidget {
  const MusicalTermsHelpScreen({super.key});

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
                  const Text('Musical Terms Help',
                      style: TextStyle(fontSize: 40)),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text:
                            'The Musical Terms page, which you can access with the ',
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
                              color: Colors.red[300],
                              icon: Icons.book,
                              iconColor: Colors.black,
                              onTap: () =>
                                  Navigator.pushNamed(context, '/terms'),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  ' icon from the menu at the bottom of the screen, or from the main menu, is where you can find musical terms and their definitions. If you see any'),
                          const TextSpan(
                            text: ' blue ',
                            style: TextStyle(
                                fontSize: 20, color: Colors.lightBlue),
                          ),
                          const TextSpan(
                              text:
                                  'words that you don\'t recognize, click on them and you will be brought to a page explaining what they mean!'),
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/', (route) => false),
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

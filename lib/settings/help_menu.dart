import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize : 20),
        foregroundColor: Colors.black);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        color: const Color.fromRGBO(239, 199, 199, 1),
                        padding: const EdgeInsets.all(8),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/termsHelp');
                          },
                          child: const Text(
                            'Terms Help',
                            style: TextStyle(fontSize: 35, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        color: const Color.fromRGBO(255, 246, 167, 1),
                        padding: const EdgeInsets.all(8),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/composersHelp');
                          },
                          child: const Text(
                            'Composers Help',
                            style: TextStyle(fontSize: 35, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        color: const Color.fromRGBO(196, 236, 249, 1),
                        padding: const EdgeInsets.all(8),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/worksHelp');
                          },
                          child: const Text(
                            'Works Help',
                            style: TextStyle(fontSize: 35, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        color: const Color.fromRGBO(225, 255, 195, 1),
                        padding: const EdgeInsets.all(8),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/quizzesHelp');
                          },
                          child: const Text(
                            'Quizzes Help',
                            style: TextStyle(fontSize: 35, color: Colors.black),
                          ),
                        ),
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

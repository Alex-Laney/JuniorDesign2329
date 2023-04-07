import 'package:artifact/bottom_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:artifact/circular_dial_menu.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
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
                    child: ElevatedButton(
                      style: style.copyWith(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            return Color.fromRGBO(255, 246, 167, 1);
                          },
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/composersHelp');
                      },
                      child: const Text('Composers'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: ElevatedButton(
                      style: style.copyWith(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            return Color.fromRGBO(239, 199, 199, 1);
                          },
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/termsHelp');
                      },
                      child: const Text('Musical Terms'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: ElevatedButton(
                      style: style.copyWith(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            return Color.fromRGBO(196, 236, 249, 1);
                          },
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/worksHelp');
                      },
                      child: const Text('Works'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: ElevatedButton(
                      style: style.copyWith(
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            return Color.fromRGBO(225, 255, 195, 1);
                          },
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/quizzesHelp');
                      },
                      child: const Text('Quizzes'),
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

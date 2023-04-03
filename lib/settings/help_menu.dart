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
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: style.copyWith(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  return Color.fromRGBO(255, 246, 167, 1);
                })),
                onPressed: () {
                  Navigator.pushNamed(context, '/composersHelp');
                },
                child: const Text('Composers'),
              ),
              ElevatedButton(
                style: style.copyWith(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  return Color.fromRGBO(239, 199, 199, 1);
                })),
                onPressed: () {
                  Navigator.pushNamed(context, '/termsHelp');
                },
                child: const Text('Musical Terms'),
              ),
              ElevatedButton(
                style: style.copyWith(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  return Color.fromRGBO(196, 236, 249, 1);
                })),
                onPressed: () {
                  Navigator.pushNamed(context, '/worksHelp');
                },
                child: const Text('Works'),
              ),
              ElevatedButton(
                style: style.copyWith(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  return Color.fromRGBO(225, 255, 195, 1);
                })),
                onPressed: () {
                  Navigator.pushNamed(context, '/quizzesHelp');
                },
                child: const Text('Quizzes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

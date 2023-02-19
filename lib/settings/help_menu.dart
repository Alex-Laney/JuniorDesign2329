import 'package:flutter/material.dart';
import 'package:artifact/circular_dial_menu.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
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
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
                child: const Text('Composers'),
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
                child: const Text('Musical Terms'),
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
                child: const Text('Music'),
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
                child: const Text('Quizzes'),
              ),
            ],
          ),
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

import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';
import 'dart:math' as math;

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    final int iconColor = 300;

    // returns the circular spanning button for module selection
    CircularMenu buildCircularDialMainMenu() {
      return CircularMenu(
        toggleButtonBoxShadow: const [],
        startingAngleInRadian: 7 * math.pi / 6,
        endingAngleInRadian: 11 * math.pi / 6,
        items: [
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.yellow[iconColor],
            icon: Icons.person,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/composers'),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.blue[iconColor],
            icon: Icons.music_note,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/works'),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.green[iconColor],
            icon: Icons.quiz,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/quizzes'),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.red[iconColor],
            icon: Icons.book,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/terms'),
          ),
        ],
      );
    }

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(25.0),
                children: const <Widget>[
                  Text("Allegro: A brisk and lively tempo"),
                  Text('Chord: A set of notes played simultaneously'),
                  Text('Scale: A sequence of notes ordered by pitch'),
                ],
              )
            ],
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildCircularDialMainMenu(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
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
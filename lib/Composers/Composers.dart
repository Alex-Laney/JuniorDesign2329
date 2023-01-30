import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';
import 'dart:math' as math;

class ComposersScreen extends StatelessWidget {
  const ComposersScreen({super.key});

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
        appBar: AppBar(
          title: const Text('Composers'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text('ComposerInformationHere')
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
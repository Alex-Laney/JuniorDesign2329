import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';
import 'dart:math' as math;

/// For module selection
class CircularDialMenu {
  static Widget build(BuildContext context) {
    const int iconColor = 300;
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

    return buildCircularDialMainMenu();
  }
}

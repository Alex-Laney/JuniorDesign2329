import 'package:flutter/material.dart';
import '/Musical-Terms/Musical-Terms.dart';
import '/Composers/Composers.dart';
import '/Musical-Works/Musical-Works.dart';
import '/Quizzes/Quizzes.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:circular_menu/circular_menu.dart';
import 'dart:math' as math;

void main() {
  runApp(
    MaterialApp(
      title: 'Artifact',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // "/" route means main screen
        '/': (context) => const MainScreen(),
        // When navigating to the "/first" route, build the FirstScreen widget.
        '/terms': (context) => const TermsScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/composers': (context) => const ComposersScreen(),
        '/works': (context) => const WorksScreen(),
        '/quizzes': (context) => const QuizzesScreen(),
        '/listen': (context) => const ListenScreen(),
      },
    ),
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  // Globally changes the strength/contrast of a color for an icon
  final int iconColor = 100;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    SpeedDial buildSpeedDialMainMenu() {
      return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 20.0),
        // label: const Text('Jump Ahead'),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.book, color: Colors.black),
            backgroundColor: Colors.red[iconColor],
            onTap: () => Navigator.pushNamed(context, '/terms'),
            label: 'Musical Terms',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            child: const Icon(Icons.quiz, color: Colors.black),
            backgroundColor: Colors.green[iconColor],
            onTap: () => Navigator.pushNamed(context, '/quizzes'),
            label: 'Quizzes',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            child: const Icon(Icons.music_note, color: Colors.black),
            backgroundColor: Colors.blue[iconColor],
            onTap: () => Navigator.pushNamed(context, '/works'),
            label: 'Music',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
          SpeedDialChild(
            child: const Icon(Icons.person, color: Colors.black),
            backgroundColor: Colors.yellow[iconColor],
            onTap: () => Navigator.pushNamed(context, '/composers'),
            label: 'Composers',
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.black,
          ),
        ],
      );
    }

    CircularMenu buildCircularDialMainMenu() {
      return CircularMenu(
        toggleButtonBoxShadow: const [],
        startingAngleInRadian: 7 * math.pi / 6,
        endingAngleInRadian: 11 * math.pi / 6,
        items: [
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.yellow[300],
            icon: Icons.person,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/composers'),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.blue[300],
            icon: Icons.music_note,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/works'),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.green[300],
            icon: Icons.quiz,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/quizzes'),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.red[300],
            icon: Icons.book,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/terms'),
          ),
        ],
      );
    }

    Widget buildBottomButtonMainMenuSection = Row(
      children: [
        Expanded(
          child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(10.0),
              child: buildSpeedDialMainMenu()),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.pushNamed(context, '/terms');
              },
              child: const Text('Terms'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.pushNamed(context, '/composers');
              },
              child: const Text('Composers'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.pushNamed(context, '/works');
              },
              child: const Text('Works'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.pushNamed(context, '/quizzes');
              },
              child: const Text('Quizzes'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.pushNamed(context, '/listen');
              },
              child: const Text('Listen'),
            ),
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
              onPressed: () {},
              icon: const Icon(Icons.home, color: Colors.black45),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}

class ListenScreen extends StatelessWidget {
  const ListenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listen'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: const Text('Sample Song (Not Implemented)'),
              ),
            ],
          ),
        ));
  }
}

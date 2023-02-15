import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';
import 'dart:math' as math;
import 'package:artifact/Musical-Terms/Term.dart';
import '../Composers/Composers.dart';
import '../Musical-Works/Musical-Works.dart';
import '../Quizzes/Quizzes.dart';
import '../main.dart';
import 'Musical-Terms.dart';

class DefScreen extends StatelessWidget {
  const DefScreen({super.key, required this.term});

  final Term term;

  // Globally changes the strength/contrast of a color for an icon
  final int iconColor = 300;

  @override
  Widget build(BuildContext context) {
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
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ComposersScreen())),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.blue[iconColor],
            icon: Icons.music_note,
            iconColor: Colors.black,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TermsScreen())),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.green[iconColor],
            icon: Icons.quiz,
            iconColor: Colors.black,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const QuizzesScreen())),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.red[iconColor],
            icon: Icons.book,
            iconColor: Colors.black,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WorksScreen())),
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          const Align(
            alignment: Alignment.bottomLeft,
            child: BackButton(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text(term.name, style: const TextStyle(fontSize: 40)),
                const SizedBox(height: 20),
                Text("Definition: ${term.definition}",
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Examples:", style: TextStyle(fontSize: 20)),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(25.0),
                    itemCount: term.examples.length,
                    itemBuilder: (context, position) {
                      return Text(term.examples[position],
                          style: const TextStyle(fontSize: 20));
                    }),
              ]),
            ),
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildCircularDialMainMenu(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen())),
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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:artifact/circular_dial_menu.dart';
import 'package:artifact/Musical-Terms/Term.dart';
import '../Composers/Composers.dart';
import '../Musical-Works/Musical-Works.dart';
import '../Quizzes/Quizzes.dart';
import '../main.dart';
import 'Musical-Terms.dart';

class DefScreen extends StatelessWidget {
  const DefScreen({super.key, required this.term});

  final Term term;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 199, 199, 1),
      body: SafeArea(
        child: Column(children: <Widget>[
          const Align(
            alignment: Alignment.topLeft,
            child: BackButton(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text(term.name, style: const TextStyle(fontSize: 40)),
                const SizedBox(height: 20),
                term.getDefinition(context),
                const SizedBox(height: 20),
                term.getExamples(context)
              ]),
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
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen())),
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

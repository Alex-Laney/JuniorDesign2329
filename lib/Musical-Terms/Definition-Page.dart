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

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:artifact/circular_dial_menu.dart';
import 'package:artifact/Musical-Works/Composition.dart';
import '../Composers/Composers.dart';
import '../Musical-Works/Musical-Works-Old.dart';
import '../Quizzes/Quizzes.dart';
import '../main.dart';

class CompScreen extends StatelessWidget {
  const CompScreen({super.key, required this.comp});

  final Comp comp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(196, 236, 249, 1),
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
                Text(comp.name, style: const TextStyle(fontSize: 40)),
                const SizedBox(height: 20),
                comp.getDefinition(context),
                const SizedBox(height: 20),
                comp.getExamples(context)
              ]),
            ),
          )
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

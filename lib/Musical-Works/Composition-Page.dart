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
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0)
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          // const Align(
          //   alignment: Alignment.topLeft,
          //   child: BackButton(),
          // ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text(comp.name, style: const TextStyle(fontSize: 40), textAlign: TextAlign.center,),
                const SizedBox(height: 20),
                comp.getComposer(context),
                const SizedBox(height: 20),
                comp.getDescription(context),
                const SizedBox(height: 20),
                comp.getExamples(context),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20, fontFamily: 'Kanit')),
                  onPressed: () {
                    Navigator.pushNamed(context, '/listen');
                  },
                  child: Text('Listen to ${comp.name}'),
                ),
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

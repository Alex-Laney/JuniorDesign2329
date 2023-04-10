import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';
import 'package:artifact/Musical-Works/Composition.dart';
import '../Composers/Composers.dart';
import '../Musical-Works/Musical-Works-Old.dart';
import '../Quizzes/Quizzes.dart';
import '../main.dart';
import '../music_box.dart';

class CompScreen extends StatelessWidget {
  const CompScreen({super.key, required this.comp});

  final Comp comp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(196, 236, 249, 1),
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // const Align(
            //   alignment: Alignment.topLeft,
            //   child: BackButton(),
            // ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      comp.name,
                      style: const TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    comp.getComposer(context),
                    const SizedBox(height: 20),
                    comp.getDescription(context),
                    const SizedBox(height: 20),
                    comp.getExamples(context),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        switch (comp.name) {
                          case 'Für Elise':
                            openingState.getPlayer
                                .seek(Duration.zero, index: 0);
                            break;
                          case 'Moonlight Sonata 1st Movement':
                            openingState.getPlayer
                                .seek(Duration.zero, index: 2);
                            break;
                          case 'Sonata 1 in F Minor Allegro':
                            openingState.getPlayer
                                .seek(Duration.zero, index: 3);
                            break;
                          case 'Sonata 8 Pathetique 1st Movement':
                            openingState.getPlayer
                                .seek(Duration.zero, index: 1);
                            break;
                        }
                        Navigator.pushNamed(context, '/listen');
                      },
                      child: Text('Listen to ${comp.name}'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}

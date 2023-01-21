import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Musical Terms'),
        ),
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
        )
    );
  }
}
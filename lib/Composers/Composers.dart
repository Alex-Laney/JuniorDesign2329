import 'package:flutter/material.dart';

class ComposersScreen extends StatelessWidget {
  const ComposersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
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
        )
    );
  }
}
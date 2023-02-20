import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text for developing team
            RichText(
              text: const TextSpan(
                text: 'Development History:\nStarted Fall 2022\n'
                    'Finished Spring 2023\nThis is a student project\n'
                    'Developers: JIB-2329\n- Andrew Chen\n- Richard Doan'
                    '\n- Alex Laney\n- Jacob Singer\n- Sanjeev Viswan',
              ),
            ),
            // Creates the button for licensing agreements
            ElevatedButton(
                style: style,
                onPressed: () => Navigator.pushNamed(context, '/license'),
                child: const Text('License'))
          ],
        ),
      ),
    );
  }
}

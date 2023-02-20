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
          children: [
            RichText(
              text: const TextSpan(
                text: 'Development History:\nStarted Fall 2022\n'
                    'Finished Spring 2023\nThis is a student project'
                    'Developers: JIB-2329',
              ),
            ),
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

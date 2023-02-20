import 'package:flutter/material.dart';

class ComposersHelpScreen extends StatelessWidget {
  const ComposersHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Composers Help'),
      ),
      body: Center(
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                text: '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

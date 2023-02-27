import 'package:flutter/material.dart';

class MusicalTermsHelpScreen extends StatelessWidget {
  const MusicalTermsHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      appBar: AppBar(
        title: const Text('Musical Terms Help'),
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

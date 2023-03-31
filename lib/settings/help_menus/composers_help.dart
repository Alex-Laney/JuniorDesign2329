import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

import '../../circular_dial_menu.dart';

class ComposersHelpScreen extends StatelessWidget {
  const ComposersHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      appBar: AppBar(
        title: const Text('Composers Help'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Composers Help', style: TextStyle(fontSize: 40)),
        Padding(
          padding: const EdgeInsets.all(40),
            child: RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                text: 'The composers page contains biographies about various famous composers who have influenced '
                    'the development of classical music. Each page covers the upbringing and career of a composer and gives'
                    ' readers insight on how they developed as a musician.',
                style:
                  const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
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
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/', (route) => false),
              tooltip: 'Home',
              icon: const Icon(Icons.home, color: Colors.black45),
            ),
            IconButton(
              onPressed: () {},
              tooltip: 'Settings',
              icon: const Icon(Icons.settings, color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}

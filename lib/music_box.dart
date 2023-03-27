import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:artifact/circular_dial_menu.dart';
import 'package:video_player/video_player.dart';
import 'main.dart';

class opening extends StatefulWidget {
  const opening({super.key});

  @override

  @override
  State<opening> createState() => _opening();
}

class _opening extends State<opening> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    void handleTimeout() {
      setState(() {
        selected = !selected;
      });
    }
    Timer scheduleTimeout([int milliseconds = 10000]) =>
        Timer(Duration(milliseconds: milliseconds), handleTimeout);
    scheduleTimeout(1000);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          const SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/main'),
                  child: const Text('Go To Home', style: TextStyle(fontSize: 30, color: Colors.orangeAccent)),
                )
              ),
            AnimatedAlign(
              alignment: selected ? Alignment.topLeft : Alignment.bottomRight,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: Image.asset('assets/images/music_note.png', scale: 2),
            ),
            const SizedBox(height: 250),
            Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/works'),
                  child: const Text('What Am I Listening To?', style: TextStyle(fontSize: 30, color: Colors.orangeAccent)),
                )
            ),
          ],
        ),
      ),
    );
  }
}






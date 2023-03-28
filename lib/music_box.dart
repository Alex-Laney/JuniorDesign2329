import 'dart:async';
import 'package:animate_do/animate_do.dart';
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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          const SizedBox(height: 150),
            Align(
              alignment: Alignment.bottomCenter,
                child: FadeInDown(duration: Duration(seconds: 4), child: topButton()),
                // TextButton(
                //   onPressed: () => Navigator.pushNamed(context, '/main'),
                //   child: const Text('Go To Home', style: TextStyle(fontSize: 30, color: Colors.orangeAccent)),
                // )
              ),
            const SizedBox(height: 100),
            Padding(
              padding: EdgeInsets.fromLTRB(65, 0, 70, 70),
              child: Image.asset('assets/images/music_box.png', scale: 2.6),
            ),
            const SizedBox(height: 50),
            Align(
                alignment: Alignment.center,
                child: FadeInUp(duration: Duration(seconds: 4), child: bottomButton()),
                // TextButton(
                //   onPressed: () => Navigator.pushNamed(context, '/works'),
                //   child: const Text('What Am I Listening To?', style: TextStyle(fontSize: 30, color: Colors.orangeAccent)),
                // )
            ),
          ],
        ),
      ),
    );
  }
}

class topButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => Navigator.pushNamed(context,
        '/main'), child: const Text('Go To Home', style: TextStyle(fontSize:
    30, color: Colors.orangeAccent)));
  }
}

class bottomButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => Navigator.pushNamed(context, '/works'),
        child: const Text('What Am I Listening To?', style: TextStyle(fontSize:
        30, color: Colors.orangeAccent)));
  }
}





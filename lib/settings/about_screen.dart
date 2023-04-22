import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40),
                  ),
                  // Text for developing team
                  RichText(
                    text: const TextSpan(
                      text: 'Development History:\nStarted Fall 2022\n'
                          'Finished Spring 2023\nThis is a student project\n'
                          'Developers: JIB-2329\n- Andrew Chen\n- Richard Doan'
                          '\n- Alex Laney\n- Jacob Singer\n- Sanjeev Viswan',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40),
                  ),
                  // Creates the button for licensing agreements
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
                      foregroundColor: Color.fromRGBO(0, 0, 0, 1.0),
                      side: BorderSide(
                        width: 5.0,
                        color: Color.fromRGBO(232, 163, 99, 1.0),
                      ),
                      elevation: 5,
                      //fixedSize: Size:,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/license');
                    },
                    child: Text(
                      'License',
                      style: TextStyle(fontSize: 80, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

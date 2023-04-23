import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Who are we?',
                      style: TextStyle(fontSize: 32),
                    ),
                    // Text for developing team
                    const Text(
                      "We are a team of developers who share a passion for "
                      "classical music and education. We believe that classical "
                      "music is a rich and diverse art form that can enrich our "
                      "lives, culture, and society. We also believe that learning "
                      "classical music should be enjoyable, accessible, and "
                      "rewarding for everyone.\n\n"
                      "That's why we created Notes on the Note Makers, an "
                      "educational classical music application that helps you "
                      "discover, learn, and appreciate classical music. Notes on "
                      "the Note Makers is designed to be informative, interactive,"
                      " and inspiring. Whether you want to explore the history "
                      "and styles of classical music, learn the basics of music "
                      "theory and notation, or listen to the works of great "
                      "composers and performers, Notes on the Note Makers can help "
                      "you expand your musical horizons. "
                      "\n\nThank you for downloading Notes on the Note Makers and "
                      "joining our classical music community. We hope you enjoy "
                      "learning classical music with us!",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Text(
                      "\nDevelopment History:",
                      style: const TextStyle(fontSize: 32),
                    ),
                    const Text(
                      "Started Fall 2022\n"
                      "Finished Spring 2023\n"
                      "Developers: JIB-2329\n- Andrew Chen\n- Richard Doan"
                      "\n- Alex Laney\n- Jacob Singer\n- Sanjeev Viswan",
                      style: const TextStyle(fontSize: 18),
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
            ),
          ],
        ),
      ),
    );
  }
}

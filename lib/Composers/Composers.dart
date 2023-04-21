import 'package:artifact/Composers/Beethoven.dart';
import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

class ComposersScreen extends StatelessWidget {
  const ComposersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 246, 167, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: <Widget>[
                      const Text('Composers', style: TextStyle(fontSize: 65)),
                      const SizedBox(height: 30),
                      MaterialButton(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/BeethovenButton.png',
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Beethoven',
                                  style: TextStyle(shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                    ),
                                  ], fontSize: 30, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/beethoven');
                        },
                        //child: const Text('Beethoven'),
                      ),
                      const SizedBox(height: 30),
                      MaterialButton(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          // Image border
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/MozartButton.png',
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Mozart',
                                  style: TextStyle(shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                    ),
                                  ], fontSize: 30, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/mozart');
                        },
                        //child: const Text('Beethoven'),
                      ),
                      const SizedBox(height: 30),
                      MaterialButton(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          // Image border
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/BachButton.png',
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Bach',
                                  style: TextStyle(shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                    ),
                                  ], fontSize: 30, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/bach');
                        },
                        //child: const Text('Beethoven'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}

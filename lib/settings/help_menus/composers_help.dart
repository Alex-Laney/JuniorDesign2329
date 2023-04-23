import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

import '../../bottom_navigation_bar/circular_dial_menu.dart';
import '../../common_ui_components/default_app_bar.dart';

class ComposersHelpScreen extends StatelessWidget {
  const ComposersHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar.build(context),
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Composers Help',
              style: TextStyle(fontSize: 40),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: 'The composers page, which you can access with the ',
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  children: <InlineSpan>[
                    WidgetSpan(
                      child: CircularMenuItem(
                        padding: 5,
                        margin: 0,
                        badgeRadius: 10,
                        iconSize: 10,
                        boxShadow: const [],
                        color: Colors.yellow[300],
                        icon: Icons.quiz,
                        iconColor: Colors.black,
                        onTap: () => Navigator.pushNamed(context, '/composers'),
                      ),
                    ),
                    const TextSpan(
                      text: ' icon from the menu at the bottom of the screen, '
                          'or from the main menu, contains biographies about '
                          'various famous composers who have influenced '
                          'the development of classical music. Each page '
                          'covers the upbringing and career of a composer and '
                          'gives readers insight on how they developed as a musician.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}

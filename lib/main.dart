import 'package:artifact/settings/about_screen.dart';
import 'package:artifact/settings/help_menu.dart';
import 'package:artifact/settings/help_menus/composers_help.dart';
import 'package:artifact/settings/help_menus/music_help.dart';
import 'package:artifact/settings/help_menus/musical_terms_help.dart';
import 'package:artifact/settings/help_menus/quizzes_help.dart';
import 'package:artifact/splash_screen.dart';
import 'package:flutter/material.dart';
import '/Musical-Terms/Musical-Terms.dart';
import '/Composers/Composers.dart';
import '/Listen/Listen.dart';
import '/Musical-Works/Musical-Compositions.dart';
import '/Quizzes/Quizzes.dart';
import 'package:artifact/settings/settings_menu.dart';
import 'circular_dial_menu.dart';
import '/Composers/Beethoven.dart';
import '/Composers/Mozart.dart';
import '/Composers/Bach.dart';
import 'music_box.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Artifact',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      theme: ThemeData(
        fontFamily: 'Kanit',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20, fontFamily: 'Kanit')),
        ),
      ),
      home: SplashScreen(),
      //initialRoute: '/',
      routes: {
        // this is the trad home page
        '/main': (context) => const MainScreen(),
        // this is actually the start
        '/opening': (context) => const opening(),
        // When navigating to the "/first" route, build the FirstScreen widget.
        '/terms': (context) => const TermsScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/composers': (context) => const ComposersScreen(),
        '/works': (context) => const CompScreen(),
        '/quizzes': (context) => const QuizzesScreen(),
        '/listen': (context) => const ListenScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/help': (context) => const HelpScreen(),
        '/about': (context) => const AboutScreen(),
        '/license': (context) => const LicensePage(
              applicationName: 'Notes on the Note Makers',
              applicationLegalese: "Copyright 2023 JIB-2329\n"
                  "Permission is hereby granted, free of charge, to any person "
                  "obtaining a copy of this software and associated "
                  "documentation files (the “Software”), to deal in the Software "
                  "without restriction, including without limitation the rights "
                  "to use, copy, modify, merge, publish, distribute, sublicense, "
                  "and/or sell copies of the Software, and to permit persons to whom the Software is "
                  "furnished to do so, subject to the following conditions: The above "
                  "copyright notice and this permission notice shall be included in all "
                  "copies or substantial portions of the Software.\n"
                  "THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS "
                  "OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF "
                  "MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. "
                  "IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY "
                  "CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, "
                  "TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE "
                  "SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.",
            ),
        '/composersHelp': (context) => const ComposersHelpScreen(),
        '/termsHelp': (context) => const MusicalTermsHelpScreen(),
        '/musicHelp': (context) => const MusicHelpScreen(),
        '/quizzesHelp': (context) => const QuizzesHelpScreen(),
        '/beethoven': (context) => const BeethovenScreen(),
        '/mozart': (context) => const MozartScreen(),
        '/bach': (context) => const BachScreen(),
      },
    ),
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  // Globally changes the strength/contrast of a color for an icon
  final int iconColor = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
              child: Image.asset('assets/images/Logo.PNG', scale: 2.0),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/terms');
              },
              child: const Text('Terms'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/composers');
              },
              child: const Text('Composers'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/works');
              },
              child: const Text('Works'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quizzes');
              },
              child: const Text('Quizzes'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/listen');
              },
              child: const Text('Listen'),
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
              onPressed: () {},
              tooltip: 'Home',
              icon: const Icon(Icons.home, color: Colors.black45),
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              tooltip: 'Settings',
              icon: const Icon(Icons.settings, color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:artifact/Quizzes/Results.dart';
import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:artifact/hive_local_data/quiz_result/quiz_result_db.dart';
import 'package:artifact/hive_local_data/rewards/rewards_points_db.dart';
import 'package:artifact/rewards/rewards_screen.dart';
import 'package:artifact/settings/about_screen.dart';
import 'package:artifact/settings/help_menu.dart';
import 'package:artifact/settings/help_menus/composers_help.dart';
import 'package:artifact/settings/help_menus/works_help.dart';
import 'package:artifact/settings/help_menus/musical_terms_help.dart';
import 'package:artifact/settings/help_menus/quizzes_help.dart';
import 'package:artifact/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/Musical-Terms/Musical-Terms.dart';
import '/Composers/Composers.dart';
import '/Listen/Listen.dart';
import '/Musical-Works/Musical-Compositions.dart';
import '/Quizzes/Quizzes.dart';
import 'package:artifact/settings/settings_menu.dart';
import 'bottom_navigation_bar/circular_dial_menu.dart';
import '/Composers/Beethoven.dart';
import '/Composers/Mozart.dart';
import '/Composers/Bach.dart';
import 'music_box.dart';

/// Global variable for the reward points database
var rewardPointsData = RewardPointsDatabase();

/// Global variable for the quiz results database
var quizResultsData = QuizResultDatabase();

void main() async {
  await Hive.initFlutter();
  var userBox = await Hive.openBox('userBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/worksHelp': (context) => const WorksHelpScreen(),
        '/quizzesHelp': (context) => const QuizzesHelpScreen(),
        '/beethoven': (context) => const BeethovenScreen(),
        '/mozart': (context) => const MozartScreen(),
        '/bach': (context) => const BachScreen(),
        '/rewardScreen': (context) => const RewardsScreen(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  // Globally changes the strength/contrast of a color for an icon
  final int iconColor = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Image.asset('assets/images/Logo.PNG', scale: 0.1),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                color: const Color.fromRGBO(239, 199, 199, 1),
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/terms');
                  },
                  child: const Text(
                    'Terms',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                color: const Color.fromRGBO(225, 255, 195, 1),
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/quizzes');
                  },
                  child: const Text(
                    'Quizzes',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                color: const Color.fromRGBO(255, 246, 167, 1),
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/composers');
                  },
                  child: const Text(
                    'Composers',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                color: const Color.fromRGBO(201, 200, 244, 1.0),
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/listen');
                  },
                  child: const Text(
                    'Listen',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                color: const Color.fromRGBO(196, 236, 249, 1),
                padding: const EdgeInsets.all(8),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/works');
                  },
                  child: const Text(
                    'Works',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
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

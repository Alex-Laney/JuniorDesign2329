import 'package:flutter/material.dart';
import '/Musical-Terms/Musical-Terms.dart';
import '/Composers/Composers.dart';
import '/Musical-Works/Musical-Works.dart';
import '/Quizzes/Quizzes.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Artifact',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // "/" route means main screen
        '/': (context) => const MainScreen(),
        // When navigating to the "/first" route, build the FirstScreen widget.
        '/terms': (context) => const TermsScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/composers': (context) => const ComposersScreen(),
        '/works': (context) => const WorksScreen(),
        '/quizzes': (context) => const QuizzesScreen(),
        '/listen': (context) => const ListenScreen(),
      },
    ),
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, '/terms');
                },
                child: const Text('Terms'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, '/composers');
                },
                child: const Text('Composers'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, '/works');
                },
                child: const Text('Works'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, '/quizzes');
                },
                child: const Text('Quizzes'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, '/listen');
                },
                child: const Text('Listen'),
              ),
            ],
          ),
        ));
  }
}

class ListenScreen extends StatelessWidget {
  const ListenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listen'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                style: style,
                onPressed: () {},
                child: const Text('Sample Song (Not Implemented)'),
              ),
            ],
          ),
        ));
  }
}

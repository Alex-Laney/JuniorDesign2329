import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../circular_dial_menu.dart';
import '../main.dart';
import 'Musical-Works.dart';

// ignore: camel_case_types
class furEliseScreen extends StatelessWidget {
  const furEliseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          const Align(
            alignment: Alignment.topLeft,
            child: BackButton(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(mainAxisSize: MainAxisSize.min, children: const <Widget>[
                Text("Fur Elise", style: TextStyle(fontSize: 40)),
                SizedBox(height: 20),
                Text("Ludwig van Beethoven",
                    style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Comparable genres:", style: TextStyle(fontSize: 20)),
                ),
                // ListView.builder(
                //     shrinkWrap: true,
                //     padding: const EdgeInsets.all(25.0),
                //     itemCount: term.examples.length,
                //     itemBuilder: (context, position) {
                //       return Text(term.examples[position],
                //           style: const TextStyle(fontSize: 20));
                    //}),
              ]),
            ),
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainScreen())),
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

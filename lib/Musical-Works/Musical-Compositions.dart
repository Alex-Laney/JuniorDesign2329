import 'package:flutter/material.dart';
import 'package:artifact/Musical-Works/Composition.dart';
import 'package:artifact/Musical-Works/CompositionsDB.dart';
import 'package:artifact/circular_dial_menu.dart';

class CompScreen extends StatefulWidget {
  const CompScreen({super.key});

  @override
  CompScreenState createState() => CompScreenState();
}

class CompScreenState extends State<CompScreen> {
  late String dropdownVal = 'A-Z';
  late List<Comp> backingList = CompsDB.initialize();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(196, 236, 249, 1),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(),
            ),
            Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(children: const <Widget>[
                SizedBox(width: 125),
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text('Works', style: TextStyle(fontSize: 40)),
                )),
                SizedBox(width: 115),
              ]),
              Row(children: const <Widget>[
                SizedBox(width: 15),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Composition"),
                )),
              ]),
              ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(5.0),
                  itemCount: backingList.length,
                  itemBuilder: (context, position) {
                    return backingList[position].menuView(context);
                  }),
            ],
          )),
        ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
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

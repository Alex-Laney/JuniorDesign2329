import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:artifact/Musical-Works/Composition.dart';
import 'package:artifact/Musical-Works/CompositionsDB.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

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
                  Row(
                    children: const <Widget>[
                      SizedBox(width: 125),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Works',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 115),
                    ],
                  ),
                  Row(
                    children: const <Widget>[
                      SizedBox(width: 15),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Composition"),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(5.0),
                    itemCount: backingList.length,
                    itemBuilder: (context, position) {
                      return backingList[position].menuView(context);
                    },
                  ),
                ],
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

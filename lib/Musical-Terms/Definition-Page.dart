import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';
import 'package:artifact/Musical-Terms/Term.dart';

class DefScreen extends StatelessWidget {
  const DefScreen({super.key, required this.term});

  final Term term;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 199, 199, 1),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/testtwo.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        term.name,
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 20),
                      term.getDefinition(context),
                      const SizedBox(height: 20),
                      term.getExamples(context),
                    ],
                  ),
                ),
              )
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

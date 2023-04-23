import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:artifact/main.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';
import 'package:artifact/music_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool mute = false;
  @override
  Widget build(BuildContext context) {
    openingState c = openingState();
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
                Navigator.pushNamed(context, '/about');
              },
              child: Text(
                'About',
                style: TextStyle(fontSize: 80, color: Colors.black),
              ),
            ),
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
                Navigator.pushNamed(context, '/help');
              },
              child: Text(
                'Help',
                style: TextStyle(fontSize: 80, color: Colors.black),
              ),
            ),
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
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    scrollable: true,
                    title: Text('Reset Data'),
                    content: Text(
                      'Are you sure you want to reset your data? You will lose'
                      ' all of your points and rewards. THIS IS NOT REVERSIBLE!',
                    ),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          rewardPointsData.reset();
                          quizResultsData.reset();
                          Hive.box('userBox').clear();
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/opening', (route) => false);
                        },
                        child: const Text('Reset'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                'Reset Data',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            IconButton(
              onPressed: () => {
                if (mute) {c.unmute()} else {c.mute()},
                setState(
                  () {
                    mute = !mute;
                  },
                ),
              },
              tooltip: '',
              icon: mute
                  ? Icon(Icons.volume_up, color: Colors.black45)
                  : Icon(Icons.volume_off, color: Colors.black45),
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

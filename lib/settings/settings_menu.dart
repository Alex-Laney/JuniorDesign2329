import 'package:flutter/material.dart';
import 'package:artifact/circular_dial_menu.dart';
import '../Listen/Listen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
  }

  class _SettingsScreenState extends State<SettingsScreen> {
    bool mute = false;
    @override
    Widget build(BuildContext context) {
      Controls c = Controls(player: ListenScreenState.getPlayer());
      final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
      return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                style: style,
                onPressed: () => Navigator.pushNamed(context, '/about'),
                child: const Text('About'),
              ),
              ElevatedButton(
                style: style,
                onPressed: () => Navigator.pushNamed(context, '/help'),
                child: const Text('Help'),
              ),
              IconButton(
                onPressed: () => {
                if (mute) {
                  c.unmute()
                }
                else {
                  c.mute()
                },
                setState(() {
                mute = !mute;
                })
              },
                tooltip: '',
                icon: mute
                    ? Icon(Icons.volume_up, color: Colors.black45) : Icon(Icons.volume_off, color: Colors.black45),
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
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false),
                tooltip: 'Home',
                icon: const Icon(Icons.home, color: Colors.black45),
              ),
              IconButton(
                onPressed: () {},
                tooltip: 'Settings',
                icon: const Icon(Icons.settings, color: Colors.black45),
              ),
            ],
          ),
        ),
      );
    }
  }


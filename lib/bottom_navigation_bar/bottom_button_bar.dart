import 'package:flutter/material.dart';

/// Bar that holds shortcut buttons to different menus
class BottomButtonBar {
  static Widget build(context) {
    return BottomAppBar(
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
            onPressed: () => Navigator.pushNamed(context, '/settings'),
            tooltip: 'Settings',
            icon: const Icon(Icons.settings, color: Colors.black45),
          ),
        ],
      ),
    );
  }
}

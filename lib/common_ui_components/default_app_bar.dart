import 'package:flutter/material.dart';

class DefaultAppBar {
  static AppBar build(context) {
    return AppBar(
      leading: BackButton(color: Colors.black),
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }
}

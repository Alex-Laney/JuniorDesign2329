import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:artifact/main.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({ super.key });

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final List<String> images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];
  int _curr = 0;
  int points = rewardPointsData.getRewardPoints();

  void _nextImage() {
    setState(() {
      _curr = (_curr + 1) % images.length;
    });
  }
  void _previousImage() {
    setState(() {
      _curr = (_curr - 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(225, 255, 195, 1),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 28),
          const Align(
            alignment: Alignment.topLeft,
            child: BackButton(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  Text("Current Points: " + points.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    textScaleFactor:
                    MediaQuery.of(context).textScaleFactor,),
                  SizedBox(height: 30,),
                  Image.asset(images[_curr]),
                  SizedBox(height: 30,),
                  Row(
                    children: <Widget>[
                      IconButton(
                        iconSize: 50,
                        onPressed: _previousImage,
                        icon: Icon(Icons.arrow_left, color: Colors.black45),
                      ),
                      SizedBox(width: 30,),
                      IconButton(
                        iconSize: 50,
                        onPressed: _nextImage,
                        icon: Icon(Icons.arrow_right, color: Colors.black45),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}
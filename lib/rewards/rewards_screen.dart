import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:artifact/rewards/rewards_database.dart';
import 'package:flutter/material.dart';
import 'package:artifact/main.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

import '../hive_local_data/rewards/rewards_points_db.dart';

class PurchaseScreen extends StatefulWidget {
  int _curr = 0;

  PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();

  void setCurr(int curr) {
    _curr = curr;
  }
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final List<String> images = RewardsDatabase.getImages();
  int points = rewardPointsData.getRewardPoints();

  void _nextImage() {
    setState(() {
      widget._curr = (widget._curr + 1) % images.length;
    });
  }

  void _previousImage() {
    setState(() {
      widget._curr = (widget._curr - 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    RewardPointsDatabase RPD = RewardPointsDatabase();
    List<int> unlocked = RPD.getRewardsUnlocked();
    Widget disp;
    if (unlocked[widget._curr] == 0) {
      disp = Column(
        children: <Widget>[
          Text(
            "Current Points: " + points.toString(),
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 250,
            width: 250,
            child: Image.asset(images[widget._curr]),
          ),
          SizedBox(
            height: 30,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
              foregroundColor: Color.fromRGBO(0, 0, 0, 1.0),
              side: BorderSide(
                  width: 5.0, color: Color.fromRGBO(194, 232, 139, 1.0)),
              elevation: 5,
              //fixedSize: Size:,
            ),
            onPressed: () {
              if (RPD.spend(RewardsDatabase.getCosts()[widget._curr])) {
                RPD.unlock(widget._curr);
              }
              setState(() {});
            },
            child: Text("Cost: " + RewardsDatabase.getCosts()[widget._curr].toString()),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              IconButton(
                iconSize: 50,
                onPressed: _previousImage,
                icon: Icon(Icons.arrow_left, color: Colors.black45),
              ),
              SizedBox(
                width: 30,
              ),
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
      );
    } else {
      disp = Column(
        children: <Widget>[
          Text(
            "Current Points: " + points.toString(),
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 250,
            width: 250,
            child: Image.asset(images[widget._curr]),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              IconButton(
                iconSize: 50,
                onPressed: _previousImage,
                icon: Icon(Icons.arrow_left, color: Colors.black45),
              ),
              SizedBox(
                width: 30,
              ),
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
      );
    }
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
              child: disp,
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

import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:artifact/rewards/rewards_database.dart';
import 'package:artifact/rewards/rewards_screen.dart';
import 'package:flutter/material.dart';
import 'package:artifact/main.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

import '../hive_local_data/rewards/rewards_points_db.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryState();
}

class _GalleryState extends State<GalleryScreen> {
  final List<String> images = RewardsDatabase.getImages();
  int points = rewardPointsData.getRewardPoints();

  @override
  Widget build(BuildContext context) {
    List<int> unlocked = RewardPointsDatabase().getRewardsUnlocked();
    List<Widget> widgetList = [];
    int i;
    unlocked[1] = 1;
    for (i = 0; i < unlocked.length; i++) {
      if (unlocked[i] == 1) {
        int index = i;
        widgetList.add(SizedBox(
            height: 100,
            width: 100,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
                  foregroundColor: Color.fromRGBO(0, 0, 0, 1.0),
                  side: BorderSide(
                      width: 5.0, color: Color.fromRGBO(194, 232, 139, 1.0)),
                  elevation: 5,
                  //fixedSize: Size:,
                ),
                onPressed: () async {
                  PurchaseScreen nextScreen = PurchaseScreen();
                  nextScreen.setCurr(index);
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nextScreen),
                  );
                  setState(() {});
                },
                child: Image.asset(images[i]))));
      } else {
        int index = i;
        widgetList.add(SizedBox(
            height: 100,
            width: 100,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
                foregroundColor: Color.fromRGBO(0, 0, 0, 1.0),
                side: BorderSide(
                    width: 5.0, color: Color.fromRGBO(194, 232, 139, 1.0)),
                elevation: 5,
                //fixedSize: Size:,
              ),
              onPressed: () async {
                PurchaseScreen nextScreen = PurchaseScreen();
                nextScreen.setCurr(index);
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => nextScreen),
                );
                setState(() {});
              },
              child: Icon(Icons.question_mark, color: Colors.black),
            )));
      }
    }
    for (i--; i % 3 != 0; i++) {
      widgetList.add(SizedBox(
        height: 100,
        width: 100,
      ));
    }
    i = 5;

    List<Widget> rewardList = [];
    for (i = 0; i < unlocked.length; i += 3) {
      rewardList.add(
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        widgetList[i],
        SizedBox(width: 10),
        widgetList[i + 1],
        SizedBox(width: 10),
        widgetList[i + 2],
      ]));
      rewardList.add(SizedBox(height: 10));
    }
    SizedBox rewardsView = SizedBox(
        height: 200,
        child: ListView.builder(
            //shrinkWrap: true,
            //padding: const EdgeInsets.all(20.0),
            itemCount: rewardList.length,
            itemBuilder: (context, position) {
              return rewardList[position];
            }));
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
          const Text(
            'Rewards',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          Text(
            'Points Available: ' + points.toString(),
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: rewardsView),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}

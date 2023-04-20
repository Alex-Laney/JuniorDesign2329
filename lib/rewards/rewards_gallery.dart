import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:artifact/rewards/rewards_database.dart';
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
  int _curr = 0;
  int points = rewardPointsData.getRewardPoints();

  @override
  Widget build(BuildContext context) {
    List<int> unlocked = RewardPointsDatabase().getRewardsUnlocked();
    SingleChildScrollView rewardsView = SingleChildScrollView();
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
          rewardsView,
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}

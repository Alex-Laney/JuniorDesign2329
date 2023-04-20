import 'package:hive_flutter/hive_flutter.dart';

import '../../rewards/rewards_database.dart';

/// Datebase that holds the user's rewards points.
class RewardPointsDatabase {
  /// Key for the RewardsDatabase
  String _rewardPointsDataKey = "REWARDPOINTS";
  String _rewardsDataKey = "REWARDSUNLOCKED";

  /// The amount of rewards points the user has.
  int rewardPoints = 0;
  List<int> rewards = List<int>.filled(RewardsDatabase.getImages().length, 0);

  final _userBox = Hive.box('userBox');

  /// Run this method if 1st time running the app.
  void createInitialData() {
    _userBox.put(_rewardPointsDataKey, rewardPoints);
    _userBox.put(_rewardsDataKey, rewards);
  }

  /// Load data from rewards database.
  void loadData() {
    rewardPoints = _userBox.get(_rewardPointsDataKey);
  }

  /// Update reward points.
  void updateData() {
    _userBox.put(_rewardPointsDataKey, rewardPoints);
  }

  /// Gets the rewards points.
  int getRewardPoints() {
    if (_userBox.get(_rewardPointsDataKey) == null) createInitialData();
    return _userBox.get(_rewardPointsDataKey);
  }
  
  List<int> getRewardsUnlocked() {
    if (_userBox.get(_rewardsDataKey) == null) createInitialData();
    return _userBox.get(_rewardsDataKey);

  }
}

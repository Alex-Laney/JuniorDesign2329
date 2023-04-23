import 'package:hive_flutter/hive_flutter.dart';

import '../../rewards/rewards_database.dart';

/// Database that holds the user's rewards points.
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

  void unlock(int i) {
    List<int> curr = _userBox.get(_rewardsDataKey);
    curr[i] = 1;
    print(curr);
    _userBox.put(_rewardsDataKey, curr);
  }

  bool spend(int cost) {
    int points = _userBox.get(_rewardPointsDataKey);
    if (points < cost) {
      return false;
    }
    _userBox.put(_rewardPointsDataKey, points - cost);
    return true;
  }

  /// Resets the rewards database to default
  void reset() {
    List<int> curr = _userBox.get(_rewardsDataKey);
    for (int i = 0; i < curr.length; i++) {
      curr[i] = 0;
    }
    print(curr);
    _userBox.put(_rewardPointsDataKey, rewardPoints = 0);
    _userBox.put(_rewardsDataKey, curr);
  }
}

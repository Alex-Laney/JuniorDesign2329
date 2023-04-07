import 'package:hive_flutter/hive_flutter.dart';

/// Datebase that holds whether the user has unlocked a reward
class RewardPointsDatabase {
  /// Key for the RewardsDatabase
  String _rewardPointsDataKey = "REWARDPOINTS";

  /// The amount of rewards points the user has
  int rewardPoints = 0;

  final _userBox = Hive.box('userBox');

  /// Run this method if 1st time running the app
  void createInitialData() {
    _userBox.put(_rewardPointsDataKey, rewardPoints);
  }

  /// Load data from rewards database.
  void loadData() {
    rewardPoints = _userBox.get(_rewardPointsDataKey);
  }

  /// Update reward points.
  void updateData() {
    _userBox.put(_rewardPointsDataKey, rewardPoints);
  }

  /// Gets the rewards list
  List getRewardPoints() {
    return _userBox.get(_rewardPointsDataKey);
  }
}

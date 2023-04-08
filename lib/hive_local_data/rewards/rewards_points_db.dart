import 'package:hive_flutter/hive_flutter.dart';

/// Datebase that holds the user's rewards points.
class RewardPointsDatabase {
  /// Key for the RewardsDatabase
  String _rewardPointsDataKey = "REWARDPOINTS";

  /// The amount of rewards points the user has.
  int _rewardPoints = 0;

  final _userBox = Hive.box('userBox');

  /// Run this method if 1st time running the app.
  void createInitialData() {
    _userBox.put(_rewardPointsDataKey, _rewardPoints);
  }

  /// Load data from rewards database.
  void loadData() {
    _rewardPoints = _userBox.get(_rewardPointsDataKey);
  }

  /// Update reward points.
  void updateData() {
    _userBox.put(_rewardPointsDataKey, _rewardPoints);
  }

  /// Gets the rewards points.
  int getRewardPoints() {
    if (_userBox.get(_rewardPointsDataKey) == null) createInitialData();
    return _userBox.get(_rewardPointsDataKey);
  }
}

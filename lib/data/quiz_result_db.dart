import 'package:hive_flutter/hive_flutter.dart';

class QuizResultDatabase {
  // TODO: make the database for the leaderboard
  //  General idea: each entry is top score with name;
  //  Store the top 5 results
  List leaderboardList = [];

  final _userBox = Hive.box('userBox');

  /// Run this method if 1st time running the app
  void createInitialData() {
    leaderboardList = [
      ["Name 1", 0],
      ["Name 2", 0],
      ["Name 3", 0],
      ["Name 4", 0],
      ["Name 5", 0]
    ];
  }

  /// Load data from result database.
  ///
  /// Uses a [key] to look up database
  void loadData(String key) {
    leaderboardList = _userBox.get(key);
  }

  /// Update result database.
  ///
  /// Uses a [key] to look up database
  void updateData(String key) {
    _userBox.put(key, leaderboardList);
  }
}

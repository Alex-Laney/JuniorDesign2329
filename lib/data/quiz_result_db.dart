import 'package:hive_flutter/hive_flutter.dart';

/// Datebase that holds the top 5 results for its respective quiz
class QuizResultDatabase {
  /// Each entry is a name with its score
  List resultList = [];

  final _userBox = Hive.box('userBox');

  /// Run this method if 1st time running the app
  void createInitialData() {
    resultList = [
      ["Name 1", 0],
      ["Name 2", 0],
      ["Name 3", 0],
      ["Name 4", 0],
      ["Name 5", 0]
    ];
  }

  /// Load data from result database.
  ///
  /// Uses a [key], which is the quiz name, to look up database
  void loadData(String key) {
    resultList = _userBox.get(key);
  }

  /// Update result database.
  ///
  /// Uses a [key], which is the quiz name, to look up database
  void updateData(String key) {
    _userBox.put(key, resultList);
  }
}

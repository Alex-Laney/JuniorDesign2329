import 'package:hive_flutter/hive_flutter.dart';

/// Datebase that holds all of the quiz results.
class QuizResultDatabase {
  /// Each entry is a name with its score
  List resultList = [];

  final _userBox = Hive.box('userBox');

  /// Run this method if 1st time entering a specific quiz
  void createInitialData(String key) {
    resultList = [
      ["Name 1", 0],
      ["Name 2", 0],
      ["Name 3", 0],
      ["Name 4", 0],
      ["Name 5", 0]
    ];
    _userBox.put(key, resultList);
  }

  /// Load data from result database.
  ///
  /// Uses a [key], which is the quiz name, to look up database
  void loadData(String key) {
    resultList = _userBox.get(key);
  }

  /// TODO: finish implementation
  ///
  /// Update result database.
  ///
  /// Uses a [key], which is the quiz name, to look up database
  void updateData(String key) {
    if (_userBox.get(key) == null) createInitialData(key);
    resultList = _userBox.get(key);
    _userBox.put(key, resultList);
  }

  /// Gets the result list of a specific quiz
  ///
  /// Uses a [key], which is the quiz name, to look up database
  List getQuizResultList(String key) {
    if (_userBox.get(key) == null) createInitialData(key);
    return _userBox.get(key);
  }

  /// Debuging: Prints the contents of a specific quiz list
  ///
  /// Uses a [key], which is the quiz name, to look up database
  void printData(String key) {
    print(_userBox.get(key));
  }
}

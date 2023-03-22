import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  int score = 0;
  int scoreLocal = 0;

  void setPointsGlobal(int points) {
    score += points;
    notifyListeners();
  }

  void resetPointsGlobal() {
    score = 0;
    notifyListeners();
  }

  void setPointsLocal(int points) {
    scoreLocal += points;
    notifyListeners();
  }

  void resetPointsLocal() {
    scoreLocal = 0;
    notifyListeners();
  }

  get getPointsGlobal => score;
  get getPointsLocal => scoreLocal;
}

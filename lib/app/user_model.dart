import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  int score = 0;
  int scoreLocal = 0;
  double money = 0;

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

  void setMoney(double money) {
    this.money += money;
    notifyListeners();
  }

  void resetMoney() {
    money = 0;
    notifyListeners();
  }

  void reset() {
    resetPointsGlobal();
    resetPointsLocal();
    resetMoney();
  }

  get getPointsGlobal => score;
  get getPointsLocal => scoreLocal;
  get getIsLoss => money < 0;
  get getMoney => getIsLoss ? "-R\$ ${money.abs()}" : "R\$ $money";
}

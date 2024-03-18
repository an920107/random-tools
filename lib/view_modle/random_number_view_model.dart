import 'dart:math';

import 'package:flutter/material.dart';

class RandomNumberViewModel with ChangeNotifier {
  int? _number;
  String get result => _number?.toString() ?? "?";

  int _upperLimit = 100;
  int get upperLimit => _upperLimit;
  set upperLimit(int value) {
    _upperLimit = value;
    notifyListeners();
  }

  int _lowerLimit = 0;
  int get lowerLimit => _lowerLimit;
  set lowerLimit(int value) {
    _lowerLimit = value;
    notifyListeners();
  }

  void setLimit({required String lower, required String upper}) {
    _lowerLimit = int.parse(lower);
    _upperLimit = int.parse(upper);
    notifyListeners();
  }

  String get limitLabel => "$_lowerLimit ~ $_upperLimit";

  final _random = Random();
  void nextRandom() {
    _number = _random.nextInt(_upperLimit - _lowerLimit + 1) + _lowerLimit;
    notifyListeners();
  }
}

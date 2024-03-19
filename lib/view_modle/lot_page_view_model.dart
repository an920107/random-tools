import 'dart:collection';

import 'package:flutter/material.dart';

class LotPageViewModel with ChangeNotifier {
  List<String> _labels = ["Squid", "Zoe", "Yuan"];
  List<String> get labels => UnmodifiableListView(_labels);
  String get labelsText => _labels.join("\n");

  /// It will return an error message when the `labelsText` is not available.
  String? updateLabels(String labelsText) {
    final newLabels = labelsText.split("\n");
    if (newLabels.length <= 1) {
      return "至少要有兩支籤";
    }
    _labels = List.from(newLabels);
    notifyListeners();
    return null;
  }
}
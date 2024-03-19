import 'dart:math';

import 'package:flutter/material.dart';

class MainViewModel {
  Color get randomColor {
    final length = Colors.primaries.length;
    final random = Random();
    return Colors.primaries[random.nextInt(length)];
  }
}

import 'package:flutter/material.dart';

extension BrightnessExtensions on Brightness {
  bool get isDarkModeEnabled => this == Brightness.dark;

  Brightness get inverse {
    switch (this) {
      case Brightness.dark:
        return Brightness.light;
      case Brightness.light:
        return Brightness.dark;
      default:
        return Brightness.light;
    }
  }
}

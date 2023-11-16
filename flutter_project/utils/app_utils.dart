import 'package:flutter/material.dart';

mixin AppUtils {
  static bool isPortrait(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return (size.width < size.height);
  }

  static bool isLandscape(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return (size.width > size.height);
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

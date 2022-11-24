import 'package:flutter/material.dart';
import 'package:organizer_app/src/ui/global/colors.dart';

class GlobalStyles {
  static const InputDecorationTheme kInputDecorationTheme = InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: GlobalColors.kTextColor, width: 1.5),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: GlobalColors.kTextColor, width: 1.5),
    ),
  );

  static getFontSize(context, factory) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * factory;
  }
}

import 'package:flutter/material.dart';

extension ThemeText on TextTheme {
  TextStyle get boldText => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  TextStyle get smallText => const TextStyle(
        fontSize: 15,
      );

  TextStyle get smallBoldText =>
      smallText.copyWith(fontWeight: FontWeight.bold);
      
  TextStyle get regularBoldText => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
}

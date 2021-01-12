import 'package:FlutterWikipedia/presentation/theme/theme_color.dart';
import 'package:flutter/material.dart';

extension ThemeText on TextTheme {
  TextStyle get boldText => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );

  TextStyle get smallText => const TextStyle(
        fontSize: 12,
      );

  TextStyle get verySmallText => const TextStyle(
        fontSize: 10,
      );

  TextStyle get smallBoldText =>
      smallText.copyWith(fontWeight: FontWeight.w500);

  TextStyle get smallVeryBoldText =>
      smallText.copyWith(fontWeight: FontWeight.bold);

  TextStyle get regularBoldText => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  TextStyle get regularText => const TextStyle(
        fontSize: 15,
      );

  TextStyle get purpleSmallBoldText => TextStyle(
        color: AppColor.purple,
        fontSize: 15,
      );
  TextStyle get blackSmallBoldText => purpleSmallBoldText.copyWith(
        color: Colors.black,
      );
}

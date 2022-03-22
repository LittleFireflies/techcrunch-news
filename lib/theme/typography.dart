import 'package:flutter/material.dart';

class NewsTypography {
  static const bigTitle = TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.bold,
  );

  static const title = TextStyle(
    fontSize: 24.0,
  );

  static const display = TextStyle(
    fontSize: 18.0,
  );

  static const displayDate = TextStyle(
    fontSize: 14.0,
  );

  static const sectionTitle = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
  );
}

extension NewsTextThemeTextStyles on TextTheme {
  TextStyle get bigTitle => NewsTypography.bigTitle;

  TextStyle get title => NewsTypography.title;

  TextStyle get display => NewsTypography.display;

  TextStyle get displayDate => NewsTypography.displayDate;

  TextStyle get sectionTitle => NewsTypography.sectionTitle;
}

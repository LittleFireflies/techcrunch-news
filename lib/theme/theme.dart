import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_crunch_news/theme/color_scheme.dart';

class NewsTheme {
  static ThemeData mainTheme() {
    return applyAllStyles(
      ThemeData.from(colorScheme: NewsColorScheme.lightColorScheme),
    );
  }

  static ThemeData applyAllStyles(
    ThemeData themeData,
  ) {
    return themeData.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: themeData.colorScheme.secondary,
        foregroundColor: themeData.colorScheme.onSecondary,
      ),
    );
  }
}

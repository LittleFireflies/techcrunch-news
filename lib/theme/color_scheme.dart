import 'package:flutter/material.dart';
import 'package:tech_crunch_news/theme/colors.dart';

class NewsColorScheme {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: NewsColors.white,
    onPrimary: NewsColors.black,
    secondary: NewsColors.grey,
    onSecondary: NewsColors.white,
    error: NewsColors.red,
    onError: NewsColors.white,
    background: NewsColors.white,
    onBackground: NewsColors.black,
    surface: NewsColors.white,
    onSurface: NewsColors.black,
  );
}

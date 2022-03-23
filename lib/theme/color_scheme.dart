import 'package:flutter/material.dart';
import 'package:tech_crunch_news/theme/colors.dart';

class NewsColorScheme {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: NewsColors.grey,
    onPrimary: NewsColors.white,
    secondary: NewsColors.white,
    onSecondary: NewsColors.black,
    error: NewsColors.red,
    onError: NewsColors.white,
    background: NewsColors.white,
    onBackground: NewsColors.black,
    surface: NewsColors.white,
    onSurface: NewsColors.black,
  );
}

extension NewsColorSchemeExtension on ColorScheme {
  Color get lightGrey => NewsColors.lightGrey;
}

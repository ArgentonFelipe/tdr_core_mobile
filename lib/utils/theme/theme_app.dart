import 'package:flutter/material.dart';

import '../styles/colors_app/colors_app.dart';
import '../styles/text_styles/text_styles.dart';
import 'dark_red_theme.dart';
import 'light_red_theme.dart';

final class ThemeApp {
  ThemeApp._();

  static final darkRedTheme = DarkRedTheme.theme;

  static final lightRedTheme = LightRedTheme.theme;

  static final _defaultInputBorderDarkBlue = OutlineInputBorder(
    borderSide: const BorderSide(
      color: ColorsApp.darkBlue,
    ),
    borderRadius: BorderRadius.circular(10),
  );

  static final darkBlueTheme = ThemeData(
    primaryColor: ColorsApp.darkBlue,
    disabledColor: ColorsApp.darkBlue.withOpacity(0.8),
    scaffoldBackgroundColor: ColorsApp.darkBlue,
    cardTheme: CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsApp.darkBlue,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(ColorsApp.darkBlue),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorsApp.darkBlue,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyleApp.body.copyWith(color: ColorsApp.darkBlue),
      labelStyle: TextStyleApp.body.copyWith(color: ColorsApp.darkBlue),
      border: _defaultInputBorderDarkBlue,
      enabledBorder: _defaultInputBorderDarkBlue,
      focusedBorder: _defaultInputBorderDarkBlue,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsApp.darkBlue,
      extendedTextStyle: TextStyleApp.button,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(
        ColorsApp.darkBlue,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsApp.darkBlue,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.darkBlue,
        foregroundColor: Colors.white,
        textStyle: TextStyleApp.button.copyWith(color: Colors.white),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: ColorsApp.darkBlue),
    ),
  );
}

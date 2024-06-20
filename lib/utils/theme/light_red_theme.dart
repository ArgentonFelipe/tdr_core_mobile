import 'package:flutter/material.dart';

import '../styles/colors_app/colors_app.dart';
import '../styles/text_styles/text_styles.dart';

final class LightRedTheme {
  static final _defaultInputBorderDarkRed = OutlineInputBorder(
    borderSide: const BorderSide(
      color: ColorsApp.red,
    ),
    borderRadius: BorderRadius.circular(10),
  );
  static final theme = ThemeData(
    primaryColor: ColorsApp.red,
    disabledColor: ColorsApp.red.withOpacity(0.8),
    scaffoldBackgroundColor: Colors.white,
    cardTheme: const CardTheme(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 5,
    ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsApp.red,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(ColorsApp.red),
    ),
    iconTheme: const IconThemeData(color: ColorsApp.white),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorsApp.red,
    ),
    drawerTheme: const DrawerThemeData(),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyleApp.body.copyWith(color: ColorsApp.red),
      labelStyle: TextStyleApp.body.copyWith(color: ColorsApp.red),
      border: _defaultInputBorderDarkRed,
      enabledBorder: _defaultInputBorderDarkRed,
      focusedBorder: _defaultInputBorderDarkRed,
      disabledBorder: _defaultInputBorderDarkRed.copyWith(
        borderSide: BorderSide(color: ColorsApp.red.withOpacity(0.7)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsApp.red,
      extendedTextStyle: TextStyleApp.button.copyWith(color: ColorsApp.white),
      foregroundColor: ColorsApp.white,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(
        ColorsApp.red,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsApp.red,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsApp.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorsApp.darkBlue,
        textStyle: TextStyleApp.button,
      ),
    ),
  );
}

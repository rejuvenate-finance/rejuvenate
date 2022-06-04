import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';

abstract class AppTheme {
  static ThemeData get light => _themeLight;
  static ThemeData get dark => _themeDark;
  static Color get textColor1 => const Color(0xFF8591B0);
}

final _themeLight = ThemeData(
  colorSchemeSeed: _baseColor,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  elevatedButtonTheme: _elevatedButtonTheme,
);

final _themeDark = ThemeData(
  colorSchemeSeed: _baseColor,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: _backgroundColor,
  cardColor: _backgroundColorLight,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  elevatedButtonTheme: _elevatedButtonTheme,
);

final _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(
      200.0,
      50.0,
    ),
  ),
);

final _baseColor = const Color(0xff279150).toMaterialColor();
const _backgroundColor = Color(0xff111827);
const _backgroundColorLight = Color(0xff151d2e);

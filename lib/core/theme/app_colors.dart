import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.white,
    required this.black,
    required this.primary,
    required this.background,
  });

  final Color white;
  final Color black;
  final Color primary;
  final Color background;

  static const light = ThemeColors(
    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),
    primary: Color(0xFF6814D2),
    background: Color(0xFFFAFAFA),
  );

  static const dark = ThemeColors(
    white: Color(0xFFFFFFFF),
    black: Color(0xFF000000),
    primary: Color(0xFF6814D2),
    background: Color(0xFFFAFAFA),
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? white,
    Color? black,
    Color? primary,
    Color? background,
  }) =>
      ThemeColors(
        white: white ?? this.white,
        black: black ?? this.black,
        primary: primary ?? this.primary,
        background: background ?? this.background,
      );

  @override
  ThemeExtension<ThemeColors> lerp(
      ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
    );
  }
}

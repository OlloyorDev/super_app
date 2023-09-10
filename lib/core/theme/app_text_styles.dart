import 'package:flutter/material.dart';
import 'package:super_app/core/theme/app_colors.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.appbarTitle,
    required this.regularCaption1,
  });

  final TextStyle appbarTitle;
  final TextStyle regularCaption1;

  static final light = AppTextStyles(
    appbarTitle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: ThemeColors.light.black,
    ),
    regularCaption1: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );

  static final dark = AppTextStyles(
    appbarTitle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: ThemeColors.dark.white,
    ),
    regularCaption1: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white
    ),
  );

  @override
  ThemeExtension<AppTextStyles> copyWith({
    TextStyle? appbarTitle,
    TextStyle? regularCaption1,
  }) =>
      AppTextStyles(
        appbarTitle: appbarTitle ?? this.appbarTitle,
        regularCaption1: regularCaption1 ?? this.regularCaption1,
      );

  @override
  ThemeExtension<AppTextStyles> lerp(
      ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }
    return AppTextStyles(
      appbarTitle: TextStyle.lerp(appbarTitle, other.appbarTitle, t)!,
      regularCaption1:
          TextStyle.lerp(regularCaption1, other.regularCaption1, t)!,
    );
  }
}

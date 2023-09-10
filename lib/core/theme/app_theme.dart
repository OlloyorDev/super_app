import 'package:flutter/material.dart';
import 'package:super_app/core/theme/app_colors.dart';
import 'package:super_app/core/theme/app_text_styles.dart';

final ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: ThemeColors.light.primary,
  ),
  appBarTheme: AppBarTheme(
    elevation: 1,
    foregroundColor: ThemeColors.light.white,
    backgroundColor: ThemeColors.light.white,
    surfaceTintColor: ThemeColors.light.white,
    titleTextStyle: AppTextStyles.light.appbarTitle,
    toolbarHeight: 56,
    scrolledUnderElevation: 1,
    iconTheme: IconThemeData(
      color: ThemeColors.light.black,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return ThemeColors.light.white;
          }
          return ThemeColors.light.white;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return ThemeColors.light.white;
          }
          return ThemeColors.light.primary;
        },
      ),
      textStyle: MaterialStatePropertyAll(
        AppTextStyles.light.regularCaption1.copyWith(
          color: ThemeColors.light.white,
        ),
      ),
      elevation: const MaterialStatePropertyAll(0),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
      ),
      fixedSize: const MaterialStatePropertyAll(
        Size(
          double.infinity,
          48,
        ),
      ),
      minimumSize: const MaterialStatePropertyAll(
        Size.fromHeight(
          48,
        ),
      ),
    ),
  ),
  scaffoldBackgroundColor: ThemeColors.light.background,
  useMaterial3: true,
);

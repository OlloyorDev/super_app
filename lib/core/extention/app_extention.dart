import 'package:flutter/material.dart';
import 'package:super_app/core/theme/app_colors.dart';

extension ThemeExtension on BuildContext {
  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;
}

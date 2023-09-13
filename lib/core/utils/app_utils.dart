import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

sealed class AppUtils {
  AppUtils._();

  static const kSpacer = Spacer();

  static const kGap = Gap(0);
  static const kGap4 = Gap(4);
  static const kGap6 = Gap(6);
  static const kGap8 = Gap(8);
  static const kGap10 = Gap(10);
  static const kGap12 = Gap(12);
  static const kGap15 = Gap(15);
  static const kGap16 = Gap(16);
  static const kGap100 = Gap(100);

  /// divider
  static const kDivider = Divider(height: 1);

  /// padding
  static const kPadding0 = EdgeInsets.zero;
  static const kPaddingAll1 = EdgeInsets.all(1);
  static const kPaddingAll4 = EdgeInsets.all(4);
  static const kPaddingAll5 = EdgeInsets.all(5);
  static const kPaddingAll8 = EdgeInsets.all(8);
  static const kPaddingAll14 = EdgeInsets.all(14);
  static const kPaddingAll16 = EdgeInsets.all(16);
  static const kPaddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingHorizontal5 = EdgeInsets.symmetric(horizontal: 5);
  static const kPaddingHorizontal48 =
      EdgeInsets.symmetric(horizontal: 48, vertical: 12);

  /// border radius
  static const kRadius = Radius.zero;
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  static const kBorderRadius30 = BorderRadius.all(Radius.circular(30));

  static const kShapeRoundedNone = RoundedRectangleBorder();
  static const kShapeRoundedAll12 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  );
  static const kShapeRoundedAll10 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
}

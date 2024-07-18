import 'package:angel_fetus/core/app_export.dart';
import 'package:flutter/material.dart';


/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillDeepPurple => ElevatedButton.styleFrom(
        backgroundColor: appTheme.deepPurple5038,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
        ),
      );
// Outline button style
  static ButtonStyle get outlinePrimary => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary.withOpacity(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.h),
        ),
        shadowColor: theme.colorScheme.primary,
        elevation: 10,
      );
  static ButtonStyle get outlineRed => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimary.withOpacity(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.h),
        ),
        shadowColor: appTheme.red500,
        elevation: 3,
      );
// text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}

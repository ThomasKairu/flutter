import 'package:angel_fetus/core/app_export.dart';
import 'package:flutter/material.dart';


class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue200,
      );
  static BoxDecoration get fillDeepOrangeC => BoxDecoration(
        color: appTheme.deepOrange1004c,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red50,
      );
// Gradient decorations
  static BoxDecoration get gradientBlueAToLightBlueA => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.35, 1),
          end: const Alignment(0.5, 0),
          colors: [appTheme.blueA200, appTheme.lightBlueA100],
        ),
      );
  static BoxDecoration get gradientDeepOrangeToPink => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [appTheme.deepOrange300, appTheme.pink300],
        ),
      );
  static BoxDecoration get gradientDeepPurpleAToDeepPurpleA => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.59, 1),
          end: const Alignment(0.62, 0),
          colors: [appTheme.deepPurpleA200, appTheme.deepPurpleA100],
        ),
      );
  static BoxDecoration get gradientOnPrimaryToDeepOrange => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onPrimary.withOpacity(1),
            appTheme.deepOrange100
          ],
        ),
      );
// Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: appTheme.pinkA100,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlack9001 => BoxDecoration(
        color: appTheme.lightGreen400,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlack9002 => BoxDecoration(
        color: appTheme.red300,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlack9003 => BoxDecoration(
        color: appTheme.blue30001,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          )
        ],
      );
  static BoxDecoration get outlineOnPrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onPrimary.withOpacity(0.47),
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder71 => BorderRadius.circular(
        71.h,
      );
// Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder25 => BorderRadius.circular(
        25.h,
      );
  static BorderRadius get roundedBorder30 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get roundedBorder77 => BorderRadius.circular(
        77.h,
      );
  static BorderRadius get roundedBorder9 => BorderRadius.circular(
        9.h,
      );
}

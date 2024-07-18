import 'package:angel_fetus/core/app_export.dart';
import 'package:flutter/material.dart';


extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get publicSans {
    return copyWith(
      fontFamily: 'Public Sans',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumBluegray400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray400,
      );
// Headline text style
  static get headlineMediumOnPrimary =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 26.fSize,
        fontWeight: FontWeight.w600,
      );
// Label text style
  static get labelLargeSemiBold_2 => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelMediumPoppinsOnPrimary =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
// Title text style
  static get titleLarge21_1 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 21.fSize,
      );
  static get titleMediumPoppins =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        fontSize: 19.fSize,
      );
  static get titleMediumPoppinsBluegray700 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.blueGray700,
        fontSize: 16.fSize,
      );
  static get titleMediumPoppinsPrimary =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 17.fSize,
      );
  static get titleMediumPublicSansBlack900 =>
      theme.textTheme.titleMedium!.publicSans.copyWith(
        color: appTheme.black900,
        fontSize: 19.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMedium_1 => theme.textTheme.titleMedium!;
  static get titleSmallBlue30001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blue30001,
      );
  static get titleSmallPinkA10001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.pinkA10001,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallRed300 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.red300,
      );
  static get titleSmallRobotoDeeporange50 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.deepOrange50,
        fontWeight: FontWeight.w500,
      );
}

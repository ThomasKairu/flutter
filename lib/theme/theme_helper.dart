import 'package:angel_fetus/core/app_export.dart';
import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();


class ThemeHelper {
  
  final _appTheme = PrefUtils().getThemeData();

  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.onPrimary.withOpacity(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

 
  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 18.fSize,
          fontFamily: 'Public Sans',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 14.fSize,
          fontFamily: 'Public Sans',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 47.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 30.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 27.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 13.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.gray500,
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 8.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 20.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 18.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.lightGreen400,
          fontSize: 14.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
      );
}


class ColorSchemes {
  static const lightCodeColorScheme =  ColorScheme.light(
    primary: Color(0X6BF4716A),
    onPrimary: Color(0XBFFFFFFF),
    onPrimaryContainer: Color(0XFF9A3D37),
  );
}


class LightCodeColors {
 
  Color get black900 => const Color(0XFF000000);

  Color get blue200 => const Color(0XFFA3C4EB);
  Color get blue30001 => const Color(0XFF6AA9F4);
  Color get blueA200 => const Color(0XFF3A94FF);

  Color get blueGray100 => const Color(0XFFD9D9D9);
  Color get blueGray400 => const Color(0XFF8C8C8D);
  Color get blueGray40001 => const Color(0XFF888888);
  Color get blueGray700 => const Color(0XFF4A5660);

  Color get deepOrange100 => const Color(0XFFFFBFBB);
  Color get deepOrange300 => const Color(0XFFFF7068);
  Color get deepOrange50 => const Color(0XFFF8DEDE);

  Color get deepOrange1004c => const Color(0X4CFFC9C7);

  Color get deepPurple5038 => const Color(0X38E8DEF8);
  Color get deepPurpleA100 => const Color(0XFFA77BEE);
  Color get deepPurpleA200 => const Color(0XFF705CE9);

  Color get gray400 => const Color(0XFFC7C7C7);
  Color get gray500 => const Color(0XFF999999);

  Color get lightBlueA100 => const Color(0XFF69E4FF);

  Color get lightGreen400 => const Color(0XFF96D267);

  Color get pink300 => const Color(0XFFE86BA7);
  Color get pinkA100 => const Color(0XFFFE6FAB);
  Color get pinkA10001 => const Color(0XFFFF6FAC);

  Color get red200 => const Color(0XFFFFA0A1);
  Color get red300 => const Color(0XFFF46A6A);
  Color get red50 => const Color(0XFFFAEDEC);
  Color get red500 => const Color(0XFFF5352A);
  Color get red50001 => const Color(0XFFEB4335);

  Color get teal50 => const Color(0XFFDDE7F3);
}

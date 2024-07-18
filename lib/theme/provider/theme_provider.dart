import 'package:angel_fetus/core/utils/pref_utils.dart';
import 'package:flutter/material.dart';


class ThemeProvider extends ChangeNotifier {
  themeChange(String themeType) async {
    PrefUtils().setThemeData(themeType);
    notifyListeners();
  }
}

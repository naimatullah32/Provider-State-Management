
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {

  var _themMode=ThemeMode.light;
  ThemeMode get themeMode1 => _themMode;


  void setTheme(themeMode2){
    _themMode=themeMode2;

    notifyListeners();
  }
}
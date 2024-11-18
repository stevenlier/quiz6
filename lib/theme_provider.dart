import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = themes[0];
  String _currentFont = fonts[0];

  ThemeData get currentThemeData => _currentTheme.copyWith(
        textTheme: _currentTheme.textTheme.apply(fontFamily: _currentFont),
      );

  String get currentFont => _currentFont;

  void changeTheme(int index) {
    if (index >= 0 && index < themes.length) {
      _currentTheme = themes[index];
      notifyListeners();
    }
  }

  void changeFont(int index) {
    if (index >= 0 && index < fonts.length) {
      _currentFont = fonts[index];
      notifyListeners();
    }
  }
}

final List<ThemeData> themes = [
  ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.light(surface: const Color.fromARGB(255, 0, 255, 38)),
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(buttonColor: Colors.blue),
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
  ),
  ThemeData.dark().copyWith(
    primaryColor: Colors.red,
    colorScheme: ColorScheme.dark(surface: Colors.black),
    scaffoldBackgroundColor: Color.fromARGB(255, 255, 0, 38),
    buttonTheme: ButtonThemeData(buttonColor: Colors.red),
    appBarTheme: AppBarTheme(backgroundColor: Colors.red),
  ),
  ThemeData.light().copyWith(
    primaryColor: Colors.green,
    colorScheme: ColorScheme.light(surface: const Color.fromARGB(255, 255, 0, 0)),
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(buttonColor: Colors.green),
    appBarTheme: AppBarTheme(backgroundColor: Colors.green),
  ),
];

final List<String> fonts = ['Roboto', 'OpenSans', 'Lobster'];

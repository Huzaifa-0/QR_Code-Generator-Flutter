import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  bool get isDarkMode => _themeMode == ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    if (isDarkMode) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}

class Themes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.orangeAccent),
    primaryColor: Colors.orangeAccent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.orangeAccent),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );
}

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  static ThemeMode? themeMode= ThemeMode.dark;

   bool get isDarkMode => themeMode == ThemeMode.dark;

static bool isDark=false;
  void toggleTheme(bool isOn) {
    isDark=isOn;
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    print(themeMode);
   
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    backgroundColor: Colors.black,
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 134, 166, 93),
    primaryColor: Color.fromARGB(255, 134, 166, 93),
    colorScheme: ColorScheme.light(),
    backgroundColor: Colors.white,
  );
}

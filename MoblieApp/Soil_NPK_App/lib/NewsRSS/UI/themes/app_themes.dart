
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData mainAppTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          foregroundColor: Colors.black
      ),
      scaffoldBackgroundColor: Color.fromARGB(255, 248, 248, 248),
      textTheme: const TextTheme(
        headline6: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        bodyText2: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      )
  );
}
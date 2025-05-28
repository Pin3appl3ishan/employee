import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.blue,
    fontFamily: 'Opensans Bold',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      elevation: 4,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    ),
  );
}

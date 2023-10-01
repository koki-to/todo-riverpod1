import 'package:flutter/material.dart';

final lightThemeData = ThemeData.from(
  colorScheme: const ColorScheme.light().copyWith(
    primary: Colors.blueAccent,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
  ),
).copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blueAccent,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blueAccent,
  ),
);

final dartThemeData = ThemeData.from(
  colorScheme: const ColorScheme.light().copyWith(
    primary: const Color(0xFFF0BC1B),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    background: Colors.grey[700],
  ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    ),
  ),
).copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.grey,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.grey[300],
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.grey,
    selectedItemColor: Colors.white,
  ),
);

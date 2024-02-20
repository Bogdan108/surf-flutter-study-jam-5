import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(color: Colors.black),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white,
    secondary: Colors.grey[800]!,
  ),
  textTheme: textTheme,
);

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: Colors.white),
    colorScheme: ColorScheme.light(
      background: Colors.grey[300]!,
      primary: Colors.black,
      secondary: Colors.grey,
    ),
    textTheme: textTheme);

const TextTheme textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  ),
  titleLarge: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  ),
  headlineLarge: TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w500,
  ),
  headlineSmall: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
  ),
  bodyMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  bodySmall: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Impact',
    fontSize: 40,
  ),
);

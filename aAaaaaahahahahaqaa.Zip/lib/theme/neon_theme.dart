import 'package:flutter/material.dart';

final ThemeData neonTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  primaryColor: const Color(0xFF00FFFF),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF00FFFF)),
    bodyMedium: TextStyle(color: Colors.white),
  ),
);

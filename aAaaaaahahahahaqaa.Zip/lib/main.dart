import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'theme/neon_theme.dart';

void main() {
  runApp(const BirhmaniApp());
}

class BirhmaniApp extends StatelessWidget {
  const BirhmaniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: neonTheme,
      home: const WelcomeScreen(),
    );
  }
}

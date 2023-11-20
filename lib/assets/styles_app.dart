import 'package:flutter/material.dart';

class StylesApp {
  static ThemeData lightTheme(BuildContext context){
    final theme = ThemeData.light();
    return theme.copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: const Color.fromARGB(255, 0, 166, 255),
        secondary: const Color.fromARGB(255, 0, 120, 184),
      )
    );
  }

  static ThemeData darkTheme(BuildContext context){
    final theme = ThemeData.dark();
    return theme.copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: const Color.fromARGB(255, 226, 16, 16),
        secondary: const Color.fromARGB(255, 161, 6, 6)
      )
    );
  }
}
import 'package:flutter/material.dart';

class StylesApp {
  static ThemeData lightTheme(BuildContext context){
    final theme = ThemeData.light();
    return theme.copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: const Color.fromARGB(255, 0, 120, 184),
        secondary: const Color.fromARGB(255, 0, 166, 255),
      ),
      primaryColor: const Color.fromARGB(255, 0, 120, 184),
      secondaryHeaderColor: const Color.fromARGB(255, 0, 166, 255),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 0, 120, 184),
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 0, 120, 184),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 120, 184),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 120, 184),
          ),
        ),
      ),
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          fontFamily: "NotoSansJP",
        )
      )
    );
  }

  static ThemeData darkTheme(BuildContext context){
    final theme = ThemeData.dark();
    return theme.copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: const Color.fromARGB(255, 161, 6, 6),
        secondary: const Color.fromARGB(255, 226, 16, 16),
      ),
      primaryColor: const Color.fromARGB(255, 161, 6, 6),
      secondaryHeaderColor: const Color.fromARGB(255, 226, 16, 16),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 161, 6, 6),
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 161, 6, 6),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 161, 6, 6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 161, 6, 6),
          ),
        ),
      ),
    );
  }
}

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData = ThemeData.dark();
  ThemeData get theme => _themeData;

  void toogleTheme(context){
    final isDark = _themeData == StylesApp.darkTheme(context);
    if(isDark) {
      _themeData = StylesApp.lightTheme(context);
    }else {
      _themeData = StylesApp.darkTheme(context);
    }
    notifyListeners();
  }
}


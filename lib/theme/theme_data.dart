import 'package:flutter/material.dart';

var myColorcSheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 56, 15, 77),
);

var myDarkColorcSheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 155, 13, 129),
);

ThemeData lightMode = ThemeData(
  useMaterial3: true,
).copyWith(
  colorScheme: myColorcSheme,
  appBarTheme:const  AppBarTheme().copyWith(
      backgroundColor: myColorcSheme.onPrimaryContainer,
      foregroundColor: myColorcSheme.primaryContainer),
  cardTheme: const CardTheme().copyWith(
    color: myColorcSheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: myColorcSheme.primaryContainer,
    ),
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.normal,
          color: myColorcSheme.onSecondaryContainer,
          fontSize: 17,
        ),
      ),
);

ThemeData darkMode = ThemeData.dark(
  useMaterial3: true,
).copyWith(
    colorScheme: myDarkColorcSheme,
    appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: myDarkColorcSheme.onPrimaryContainer,
        foregroundColor: myDarkColorcSheme.primaryContainer),
    cardTheme: const CardTheme().copyWith(
      color: myDarkColorcSheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: myDarkColorcSheme.onPrimaryContainer,
        foregroundColor: myDarkColorcSheme.primaryContainer,
      ),
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          color: myDarkColorcSheme.onSecondaryContainer,
          fontSize: 17,
        ),
        bodyMedium: TextStyle(
          color: myDarkColorcSheme.onSecondaryContainer,
        ),
        bodySmall: TextStyle(
          color: myDarkColorcSheme.primary,
        ),
        ),
    bottomSheetTheme:const BottomSheetThemeData().copyWith(
      backgroundColor: myDarkColorcSheme.onPrimaryContainer,
    ),
    iconTheme: ThemeData().iconTheme.copyWith(
          color: myDarkColorcSheme.primary,
        ));

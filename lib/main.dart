import 'package:expenses/widgets/expanses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var myColorcSheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 56, 15, 77),
);

var myDarkColorcSheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 90, 22, 123),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expanses",
      themeMode: ThemeMode.dark,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: myColorcSheme,
        appBarTheme: AppBarTheme().copyWith(
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
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: myColorcSheme.onSecondaryContainer,
                fontSize: 17,
              ),
            ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: myDarkColorcSheme,
        appBarTheme: AppBarTheme().copyWith(
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
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: myDarkColorcSheme.onSecondaryContainer,
                fontSize: 17,
              ),
            ),
            bottomSheetTheme: BottomSheetThemeData().copyWith(
              backgroundColor: myDarkColorcSheme.onPrimaryContainer,
            ),
            
      ),
      home: const Expanses(),
    );
  }
}

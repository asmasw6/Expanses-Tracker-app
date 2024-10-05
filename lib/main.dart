import 'package:expenses/theme/theme_data.dart';
import 'package:expenses/theme/theme_provider.dart';
import 'package:expenses/widgets/expanses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider =
        Provider.of<ThemeProvider>(context); // Get the ThemeProvider

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode, // Default light theme
      darkTheme: darkMode, // Default dark theme
      // Use themeMode to automatically switch between light and dark themes
      themeMode:
          themeProvider.getlightModeEnable ? ThemeMode.light : ThemeMode.dark,
      home: Expanses(themeProvider.getlightModeEnable),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_provider.dart';
import 'main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),  // Menyediakan ThemeProvider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // Mengambil tema aktif

    return MaterialApp(
      title: 'Multi-Theme & Multi-Font App',
      theme: themeProvider.currentThemeData, // Terapkan tema aktif
      home: MainScreen(),
    );
  }
}

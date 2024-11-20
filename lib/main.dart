// File: lib/main.dart
import 'package:flutter/material.dart';
import 'package:newsapp/screens/splash_screen.dart';
import 'package:newsapp/screens/search_screen.dart';
import 'package:newsapp/screens/categories_screen.dart';
import 'package:newsapp/screens/home_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primaryColor: Colors.green, // Green for app bar
        scaffoldBackgroundColor: Colors.white, // White background
        textTheme: TextTheme(
          titleLarge: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // For app bar titles
          bodyLarge: const TextStyle(color: Colors.black), // Default text
          bodyMedium: const TextStyle(color: Colors.black54), // Subdued text
          titleMedium: TextStyle(color: Colors.amber.shade700, fontWeight: FontWeight.bold), // Golden yellow for headlines
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green, // Green app bar
          foregroundColor: Colors.white, // White text/icons on app bar
        ),
        iconTheme: const IconThemeData(color: Colors.white), // White icons
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/categories': (context) => const CategoriesScreen(),
        '/search': (context) => const SearchScreen(),
      },
    );
  }
}

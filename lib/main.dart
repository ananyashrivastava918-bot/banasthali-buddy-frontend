import 'package:flutter/material.dart';
import 'package:frontend/screens/splash_screen.dart';
import 'dart:io';
import 'services/http_override.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banasthali Buddy',
      theme: ThemeData(

        brightness: Brightness.light, // 🌿 Light Theme

        primaryColor: const Color(0xFF2F6F6D), // Deep Teal

        scaffoldBackgroundColor: const Color(0xFFE6F4F1), // Soft Mint Background

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE6F4F1),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF1F3C3A),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF1F3C3A)),
        ),

        cardTheme: CardThemeData(
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAlias,
        ),

        listTileTheme: const ListTileThemeData(
          iconColor: Color(0xFF2F6F6D),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F3C3A),
            fontSize: 16,
          ),
          subtitleTextStyle: TextStyle(
            color: Color(0xFF4A6B68),
          ),
        ),

        iconTheme: const IconThemeData(
          color: Color(0xFF4A6B68),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2F6F6D), // Teal Button
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF2F6F6D),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Color(0xFF1F3C3A)),
          hintStyle: const TextStyle(color: Color(0xFF4A6B68)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFCDEAE4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF2F6F6D), width: 1.5),
          ),
          errorStyle: const TextStyle(color: Colors.redAccent),
        ),

        colorScheme: const ColorScheme.light().copyWith(
          primary: Color(0xFF2F6F6D),
          secondary: Color(0xFF4A6B68),
          background: Color(0xFFE6F4F1),
          surface: Colors.white,
          onSurface: Color(0xFF1F3C3A),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

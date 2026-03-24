import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/signup_screen.dart';
import '../services/api_service.dart'; // ✅ ADD THIS

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final ApiService apiService = ApiService(); // ✅ ADD THIS

  @override
  void initState() {
    super.initState();

    // ✅ NEW: Server warmup (NO UI CHANGE)
    apiService.pingServer();

    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE6F4F1), // Light Mint
              Color(0xFFCDEAE4), // Soft Teal
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// 🔵 LOGO
              Image.asset(
                'assets/images/logo.jpeg',
                height: 200,
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
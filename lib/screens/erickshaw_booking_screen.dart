import 'package:flutter/material.dart';
import 'select_pickup_screen.dart';

class ErickshawBookingScreen extends StatelessWidget {
  const ErickshawBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E-Rickshaw Booking")),

      body: Stack(
        children: [

          /// 🔵 BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset(
              "assets/images/rickshaw_bg.png",
              fit: BoxFit.cover,
            ),
          ),

          /// 🔵 DARK OVERLAY (button clearly visible)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.15),
            ),
          ),

          /// 🔵 CENTER BUTTON
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2F6F6D),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Book a Ride",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SelectPickupScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
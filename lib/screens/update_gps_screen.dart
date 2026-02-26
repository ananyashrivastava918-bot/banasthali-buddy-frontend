import 'package:flutter/material.dart';
import 'driver_home_screen.dart';

class UpdateGPSScreen extends StatefulWidget {
  const UpdateGPSScreen({super.key});

  @override
  State<UpdateGPSScreen> createState() => _UpdateGPSScreenState();
}

class _UpdateGPSScreenState extends State<UpdateGPSScreen> {

  bool isSharing = false;
  String locationStatus = "Location Sharing: OFF";
  String lastUpdated = "Not Updated Yet";

  void startSharing() async {
    // 🔥 Backend GPS API call yaha lagegi

    setState(() {
      isSharing = true;
      locationStatus = "Location Sharing: ON";
      lastUpdated = DateTime.now().toString();
    });
  }

  void stopSharing() async {
    // 🔥 Backend stop API call yaha lagegi

    setState(() {
      isSharing = false;
      locationStatus = "Location Sharing: OFF";
      lastUpdated = DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F6F6D),
      body: Column(
        children: [

          const SizedBox(height: 70),

          /// 🔙 Top Bar
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              const Expanded(
                child: Text(
                  "Update GPS Location",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Color(0xFFE6F4F1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 📍 Current Status
                  const Text(
                    "Current Status",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(locationStatus),
                          const SizedBox(height: 5),
                          Text("Last Updated: $lastUpdated"),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// 🔘 Start Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2F6F6D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: isSharing ? null : startSharing,
                      child: const Text("Start Sharing Location"),
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// 🔘 Stop Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF2F6F6D)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: isSharing ? stopSharing : null,
                      child: const Text(
                        "Stop Sharing Location",
                        style: TextStyle(color: Color(0xFF2F6F6D)),
                      ),
                    ),
                  ),

                  const Spacer(),

                  /// 🏠 Direct Dashboard Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DriverHomeScreen()),
                              (route) => false,
                        );
                      },
                      child: const Text("Go to Driver Dashboard"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
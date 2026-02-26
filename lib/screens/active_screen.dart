import 'package:flutter/material.dart';
import 'driver_home_screen.dart';

class ActiveRideScreen extends StatefulWidget {
  const ActiveRideScreen({super.key});

  @override
  State<ActiveRideScreen> createState() => _ActiveRideScreenState();
}

class _ActiveRideScreenState extends State<ActiveRideScreen> {

  bool rideStarted = false;

  // Backend se aayega
  String studentName = "";
  String pickupLocation = "";
  String dropLocation = "";
  String rideStatus = "No Active Ride";

  void startRide() {
    // 🔥 Backend API call yaha lagegi
    setState(() {
      rideStarted = true;
      rideStatus = "Ride In Progress";
    });
  }

  void endRide() {
    // 🔥 Backend API call yaha lagegi
    setState(() {
      rideStarted = false;
      rideStatus = "Ride Completed";
    });
  }

  void callStudent() {
    // 🔥 Future: integrate phone call API
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Calling student...")),
    );
  }

  void viewRoute() {
    // 🔥 Future: integrate Google Maps
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Opening route...")),
    );
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
                  "Active Ride",
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

                  /// 🚗 Ride Details Card
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            studentName.isEmpty
                                ? "Student Name"
                                : studentName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            pickupLocation.isEmpty
                                ? "Pickup Location"
                                : pickupLocation,
                          ),

                          const SizedBox(height: 5),

                          Text(
                            dropLocation.isEmpty
                                ? "Drop Location"
                                : dropLocation,
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "Status: $rideStatus",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// ▶️ Start Ride Button
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
                      onPressed: rideStarted ? null : startRide,
                      child: const Text("Start Ride"),
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// ⏹ End Ride Button
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
                      onPressed: rideStarted ? endRide : null,
                      child: const Text(
                        "End Ride",
                        style: TextStyle(color: Color(0xFF2F6F6D)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// 📞 Call Student
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: callStudent,
                      child: const Text("Call Student"),
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// 🗺 View Route
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: viewRoute,
                      child: const Text("View Route"),
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
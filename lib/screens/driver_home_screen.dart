import 'package:flutter/material.dart';
import 'driver_profile_screen.dart';
import 'ride_request_screen.dart';
import 'active_ride_screen.dart';
import 'update_gps_screen.dart';
import 'ride_history_screen.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {

  bool isOnline = false;
  List<Map<String, dynamic>> rideRequests = [];

  String driverName = "";
  String vehicleNumber = "";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [

          /// 🔷 TOP HEADER
          Container(
            height: height * 0.35,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2F6F6D),
                  Color(0xFF4A9C97),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Center(
                child: Text(
                  "Driver Dashboard",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          /// ⚪ WHITE CONTAINER
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.75,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: const Color(0xFFE6F4F1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 15,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  _menuTile(
                    title: driverName.isEmpty
                        ? "Driver Name"
                        : driverName,
                    subtitle: vehicleNumber.isEmpty
                        ? "Vehicle Number"
                        : vehicleNumber,
                    trailingWidget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Online"),
                        Switch(
                          value: isOnline,
                          activeColor: const Color(0xFF2F6F6D),
                          onChanged: (val) {
                            setState(() {
                              isOnline = val;
                            });
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DriverProfileScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  _simpleTile(
                    title:
                    "${rideRequests.length} Pending Ride Requests",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RideRequestScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  _simpleTile(
                    title: "Active Ride",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ActiveRideScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  _simpleTile(
                    title: "Update GPS Location",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const UpdateGPSScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  _simpleTile(
                    title: "Ride History",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RideHistoryScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  /// 🔴 LOGOUT BUTTON (NEWLY ADDED)
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFF2F6F6D),
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF2F6F6D),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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

  Widget _menuTile({
    required String title,
    required String subtitle,
    required Widget trailingWidget,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              style: const TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 10),

            trailingWidget,
          ],
        ),
      ),
    );
  }

  Widget _simpleTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2F6F6D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
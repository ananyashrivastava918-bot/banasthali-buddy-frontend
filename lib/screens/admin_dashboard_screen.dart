import 'package:flutter/material.dart';
import '../services/admin_api_service.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  int students = 0;
  int drivers = 0;
  int rides = 0;
  int listings = 0;

  @override
  void initState() {
    super.initState();
    loadDashboard();
  }

  void loadDashboard() async {
    String token = "YOUR_JWT_TOKEN";

    final data = await AdminApiService.getDashboardStats();

    setState(() {
      students = data["students"];
      drivers = data["drivers"];
      rides = data["activeRides"];
      listings = data["listings"];
    });
  }

  Widget dashboardCard(String title, String value, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(icon, size: 35, color: const Color(0xFF2F6F6D)),

            const SizedBox(height: 10),

            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        backgroundColor: const Color(0xFF2F6F6D),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,

          children: [

            dashboardCard("Students", students.toString(), Icons.school),

            dashboardCard("Drivers", drivers.toString(), Icons.drive_eta),

            dashboardCard("Active Rides", rides.toString(), Icons.directions_car),

            dashboardCard("Listings", listings.toString(), Icons.store),

          ],
        ),
      ),
    );
  }
}
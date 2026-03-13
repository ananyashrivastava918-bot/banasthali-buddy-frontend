import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

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

            dashboardCard("Students", "240", Icons.school),

            dashboardCard("Drivers", "12", Icons.drive_eta),

            dashboardCard("Active Rides", "8", Icons.directions_car),

            dashboardCard("Listings", "5", Icons.store),

          ],
        ),
      ),
    );
  }
}
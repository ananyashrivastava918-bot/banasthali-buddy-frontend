import 'package:flutter/material.dart';
import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {

  final String role;

  const SettingsScreen({super.key, required this.role});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          /// 🔵 TOP GRADIENT HEADER
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
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
                  "Settings",
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
              height: MediaQuery.of(context).size.height * 0.75,
              padding: const EdgeInsets.all(25),
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

              child: ListView(
                children: [

                  /// ACCOUNT
                  _tile(context, "Edit Profile", Icons.person),

                  _tile(context, "Change Password", Icons.lock),

                  /// DRIVER EXTRA OPTION
                  if (role == "driver")
                    _tile(context, "Vehicle Details", Icons.directions_car),

                  /// ADMIN EXTRA OPTION
                  if (role == "admin")
                    _tile(context, "Manage Users", Icons.supervisor_account),

                  const SizedBox(height: 20),

                  /// LOGOUT
                  _logoutTile(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Normal Tile
  Widget _tile(BuildContext context, String title, IconData icon) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF2F6F6D)),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }

  /// 🔹 Logout
  Widget _logoutTile(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(
        leading: const Icon(Icons.logout, color: Colors.red),
        title: const Text("Logout"),
        onTap: () {

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const LoginScreen(),
            ),
                (route) => false,
          );

        },
      ),
    );
  }
}
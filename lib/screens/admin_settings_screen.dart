import 'package:flutter/material.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color(0xFF2F6F6D),
      ),

      body: ListView(

        children: [

          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            onTap: () {},
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("App Info"),
            onTap: () {},
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Manage Users"),
        backgroundColor: const Color(0xFF2F6F6D),
      ),

      body: ListView(

        children: [

          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text("Amit Sharma"),
            subtitle: const Text("Student"),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ),

          const Divider(),

          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text("Ravi Kumar"),
            subtitle: const Text("Driver"),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
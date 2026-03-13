import 'package:flutter/material.dart';

class AdminRoutesScreen extends StatelessWidget {
  const AdminRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Manage Routes"),
        backgroundColor: const Color(0xFF2F6F6D),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2F6F6D),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      body: ListView(

        children: [

          ListTile(
            leading: const Icon(Icons.route),
            title: const Text("Hostel → Main Gate"),
            subtitle: const Text("Stops: 5"),
            trailing: const Icon(Icons.edit),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.route),
            title: const Text("Library → Market"),
            subtitle: const Text("Stops: 4"),
            trailing: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
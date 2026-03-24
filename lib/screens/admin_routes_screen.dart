import 'package:flutter/material.dart';
import '../services/admin_api_service.dart';

class AdminRoutesScreen extends StatefulWidget {
  const AdminRoutesScreen({super.key});

  @override
  State<AdminRoutesScreen> createState() => _AdminRoutesScreenState();
}

class _AdminRoutesScreenState extends State<AdminRoutesScreen> {

  List routes = [];

  @override
  void initState() {
    super.initState();
    loadRoutes();
  }

  // Load routes from backend
  void loadRoutes() async {

    String token = "YOUR_JWT_TOKEN"; // replace later with stored token

    final data = await AdminApiService.getRoutes();

    setState(() {
      routes = data;
    });
  }

  // Delete route
  void deleteRoute(String id) async {

    String token = "YOUR_JWT_TOKEN";

    await AdminApiService.deleteRoute(id);

    loadRoutes();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Routes"),
        backgroundColor: const Color(0xFF2F6F6D),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2F6F6D),
        onPressed: () {
          print("Add route pressed");
        },
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index){

          final route = routes[index];

          return Column(
            children: [

              ListTile(
                leading: const Icon(Icons.route),

                title: Text(route["name"] ?? ""),

                subtitle: Text("Stops: ${route["stops"] ?? 0}"),

                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    deleteRoute(route["id"]);
                  },
                ),
              ),

              const Divider(),

            ],
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/driver_home_screen.dart';
import 'package:frontend/screens/admin_home_screen.dart';
import '../services/api_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ApiService apiService = ApiService();
  bool isLoading = false;

  String selectedRole = "Student";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// ROLE DROPDOWN
              DropdownButtonFormField<String>(
                value: selectedRole,
                decoration: const InputDecoration(
                  labelText: "Select Role",
                ),
                items: ["Student", "Driver", "Admin"]
                    .map((role) => DropdownMenuItem(
                  value: role,
                  child: Text(role),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              /// Name
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                ),
              ),

              const SizedBox(height: 15),

              /// Email
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),

              const SizedBox(height: 15),

              /// Password
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),

              const SizedBox(height: 25),

              /// Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {

                    setState(() => isLoading = true);

                    final success = await apiService.signup(
                      nameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      selectedRole.toLowerCase(),
                    );

                    setState(() => isLoading = false);

                    if (!mounted) return;

                    if (success) {

                      if (selectedRole == "Driver") {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DriverHomeScreen(),
                          ),
                        );

                      } else if (selectedRole == "Admin") {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AdminHomeScreen(),
                          ),
                        );

                      } else {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomeScreen(),
                          ),
                        );

                      }

                    } else {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Signup failed")),
                      );

                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Sign Up"),
                ),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
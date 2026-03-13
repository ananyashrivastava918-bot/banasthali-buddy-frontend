import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/driver_home_screen.dart'; // 🔹 driver home
import 'package:frontend/screens/signup_screen.dart';
import '../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ApiService apiService = ApiService();
  bool isLoading = false;
  bool rememberMe = false;

  /// 🔹 NEW ROLE VARIABLE
  String selectedRole = "Student";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// 🔵 TOP GRADIENT
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
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
            alignment: Alignment.center,
            child: const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /// 🔵 ROUNDED CONTAINER
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.70,
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
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    const SizedBox(height: 20),

                    /// 🔹 ROLE DROPDOWN
                    DropdownButtonFormField<String>(
                      value: selectedRole,
                      decoration: InputDecoration(
                        labelText: "Select Role",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: ["Student", "Driver"]
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

                    /// Email
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Login Button
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
                        onPressed: () async {

                          setState(() => isLoading = true);

                          final success = await apiService.login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            //selectedRole.toLowerCase(), // 🔹 role sent
                          );

                          if (!mounted) return;
                          setState(() => isLoading = false);

                          if (success) {

                            if (selectedRole == "Student") {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomeScreen(),
                                ),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const DriverHomeScreen(),
                                ),
                              );
                            }

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Login failed")),
                            );
                          }
                        },
                        child: isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text("Sign In"),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(color: Color(0xFF2F6F6D)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

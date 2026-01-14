import 'signup_screen.dart';
TextButton(
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(builder: (context) => const SignupScreen()),
);
},
child: const Text("Don't have an account? Sign Up"),
),

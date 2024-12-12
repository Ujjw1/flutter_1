// ignore_for_file: file_names, unused_import
import 'package:demo/component/button.dart';
import 'package:demo/component/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatelessWidget {
  final VoidCallback onTap; // Proper declaration of onTap in constructor

  const MyHomePage({super.key, required this.onTap});

  // Proper implementation of the Login function
  void login() {
    // Implement your login functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome Back',
              style: TextStyle(fontSize: 24), // Optional: Adjust text size
            ),
            const SizedBox(height: 25),
            const Myclassfield(
              hintext: "Email",
              obscureText: false,
            ),
            const SizedBox(height: 20),
            const Myclassfield(
              hintext: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 25),
            Button(
              text: 'Login',
              onTap: login, // Correct reference to the login function
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 5), // Add space between text and link
                GestureDetector(
                  onTap: onTap, // Proper use of the onTap passed from parent
                  child: const Text(
                    "Register now", // Corrected spelling to 'Register'
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Colors.blue, // Optional: Make link visually distinct
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

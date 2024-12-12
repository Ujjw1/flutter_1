// ignore: unused_import
import 'package:demo/component/button.dart';
import 'package:demo/component/inputfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final VoidCallback onTap;
  const RegisterPage({super.key, required this.onTap});
  void register() {}
  @override
  Widget build(context) {
    return Scaffold(
      // ignore: deprecated_member_use
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
            const SizedBox(
              height: 20,
            ),
            const Text('Create Account now'),
            const SizedBox(
              height: 25,
            ),
            const Myclassfield(
              hintext: "Email",
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            const Myclassfield(
              hintext: "password",
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            const Myclassfield(
              hintext: "Confirm password",
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            Button(
              text: 'register',
              onTap: register,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    "Login now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

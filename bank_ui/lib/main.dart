import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChimpvineLoginPage extends StatefulWidget {
  @override
  _ChimpvineLoginPageState createState() => _ChimpvineLoginPageState();
}

class _ChimpvineLoginPageState extends State<ChimpvineLoginPage> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> _login() async {
    const String loginUrl =
        'https://site.chimpvine.com/wp-json/jwt-auth/v1/token'; // JWT auth endpoint

    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': _userIdController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String token = data['token']; // JWT token

        print('Login successful. Token: $token');
        _fetchUserData(token); // Fetch user data using the token

        // Navigate to the restricted page after successful login
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RestrictedPage()),
        );
      } else {
        setState(() {
          errorMessage = 'Login failed. Please check your credentials.';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error during login: $e';
      });
    }
  }

  Future<void> _fetchUserData(String token) async {
    const String userUrl =
        'https://site.chimpvine.com/wp-json/wp/v2/users/me'; // Fetch current user data

    try {
      final response = await http.get(
        Uri.parse(userUrl),
        headers: {
          'Authorization': 'Bearer $token', // Pass the JWT token in the request
        },
      );

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        print('User data: $userData');
      } else {
        print('Failed to fetch user data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chimpvine Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userIdController,
              decoration: InputDecoration(labelText: 'User ID'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            if (errorMessage.isNotEmpty) ...[
              SizedBox(height: 20),
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

// Create a new page that is restricted to logged-in users
class RestrictedPage extends StatelessWidget {
  const RestrictedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restricted Page')),
      body: const Center(
        child: Text('Welcome to the restricted area!'),
      ),
    );
  }
}

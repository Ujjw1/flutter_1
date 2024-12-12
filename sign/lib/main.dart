import 'package:flutter/material.dart';

// ignore: unused_import
// import 'package:sign/Otp.dart';
// import 'package:sign/sing.dart';

// ignore: unused_import
import 'Students.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Student(),
    );
  }
}

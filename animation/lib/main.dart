import 'package:animation/home.dart';
import 'package:animation/models/Expane_data.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ExpenseData(),
        builder: (context, child) => const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Homepage(),
            ));
  }
}

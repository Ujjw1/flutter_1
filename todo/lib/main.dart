import 'package:flutter/material.dart';
// ignore: unnecessary_import

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/home.dart';

void main() async {
  await Hive.initFlutter();

  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const home(),
      theme: ThemeData(primaryColor: Colors.yellow),
    );
  }
}

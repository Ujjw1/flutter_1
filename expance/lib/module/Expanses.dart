// ignore: file_names
import 'package:expance/module/Expanse.dart';

import 'package:expance/module/expanses_list.dart';
import 'package:flutter/material.dart';

class Expanses extends StatefulWidget {
  const Expanses({super.key});

  @override
  State<Expanses> createState() {
    // ignore: no_logic_in_create_state
    return _ExpanseState();
  }
}

class _ExpanseState extends State<Expanses> {
  // ignore: unused_field

  final List<expanse> _registerExpanse = [
    expanse(
        title: 'flutter course',
        amount: 99999,
        data: DateTime.now(),
        category: Category.work),
    expanse(
        title: 'flutter course',
        amount: 99999,
        data: DateTime.now(),
        category: Category.work)
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          // ignore: unnecessary_const
          const Text('The Chart'),
          expanses_List(expanses: _registerExpanse),
        ],
      ),
    );
  }
}

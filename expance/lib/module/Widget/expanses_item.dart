import 'package:flutter/material.dart';
import 'package:expance/module/Expanse.dart';

// ignore: camel_case_types
class expanses_item extends StatelessWidget {
  const expanses_item(this.Expanse, {super.key});

  // ignore: non_constant_identifier_names
  final expanse Expanse;

  @override
  Widget build(context) {
    return Card(
      color: Colors.black,
      child: Text(Expanse.title),
    );
  }
}

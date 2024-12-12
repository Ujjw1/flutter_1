import 'package:expance/module/Widget/expanses_item.dart';
import 'package:flutter/material.dart';
import 'package:expance/module/Expanse.dart';

// ignore: camel_case_types
class expanses_List extends StatelessWidget {
  const expanses_List(
      // ignore: non_constant_identifier_names/
      {super.key,
      required this.expanses});

  final List<expanse> expanses;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expanses.length,
      itemBuilder: (ctx, index) => expanses_item(expanses[index]),
    );
  }
}
  
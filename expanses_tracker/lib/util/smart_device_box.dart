import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mysmartdevice extends StatelessWidget {
  Mysmartdevice({
    super.key,
    required this.smartDevicename,
    required this.iconPath,
    required this.poweron,
    required this.onChanged,
  });

  final String smartDevicename;
  final String iconPath;
  final bool poweron;

  void Function(bool)? onChanged;

  @override
  Widget build(context) {
    // ignore: avoid_unnecessary_containers
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        decoration: BoxDecoration(
          color: poweron ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconPath,
              height: 90,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  smartDevicename,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: poweron ? Colors.white : Colors.black,
                  ),
                )),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(value: poweron, onChanged: onChanged),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

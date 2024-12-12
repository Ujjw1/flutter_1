// ignore: unused_import
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:scanner/result.dart';

// ignore: use_full_hex_values_for_flutter_colors
const bgcolor = Color(0xffffafafa);

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isscanCompleted = false;

  void closeSccaner() {
    isscanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Qr Sccaner'),
        ),
        backgroundColor: bgcolor,
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                // ignore: avoid_unnecessary_containers
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'place Qr are code in the area',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Qr code scan automatically',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: MobileScanner(
                  onDetect: (barcode) {
                    if (!isscanCompleted) {
                      String code = barcode.rawValue ?? '---';
                      isscanCompleted = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => resulpage(
                                    closeSccaner: closeSccaner,
                                    code: code,
                                  )));
                    }
                  },
                ),
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Developed by Ujjwal Shrivastav',
                  style: TextStyle(
                      color: Colors.black87, fontSize: 14, letterSpacing: 1),
                ),
              ))
            ],
          ),
        ));
  }
}

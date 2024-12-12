// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class resulpage extends StatelessWidget {
  const resulpage({required this.code, required this.closeSccaner, super.key});

  final String code;
  final Function() closeSccaner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Qr Sccaner'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            QrImageView(
              data: 'code',
              size: 150,
              version: QrVersions.auto,
            ),
            const Text(
              'Scan result',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '$code',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Copy',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

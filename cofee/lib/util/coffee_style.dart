import 'package:flutter/material.dart';

class cofee extends StatelessWidget {
  const cofee({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'images/coffee.jpg',
              ),
            ),
            Column(
              children: [
                Text('latte', style: TextStyle(fontSize: 28)),
                Text('With almood milk',
                    style: TextStyle(color: Colors.grey[300]))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

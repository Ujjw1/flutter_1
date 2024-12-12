import 'package:flutter/material.dart';

// ignore: camel_case_types
class mycard extends StatelessWidget {
  final double balance;
  final int cardNumber;
  final int expirymonth;
  final int expiryyear;
  // ignore: prefer_typing_uninitialized_variables
  final color;

  const mycard(
      {required this.balance,
      required this.cardNumber,
      required this.color,
      required this.expirymonth,
      required this.expiryyear,
      super.key});

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Balance',
                  style: TextStyle(color: Colors.white),
                ),
                Image.asset(
                  'images/visa.png',
                  height: 50,
                )
              ],
            ),
            Text(
              // ignore: prefer_interpolation_to_compose_strings
              '\$' + balance.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardNumber.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  expirymonth.toString() + '/' + expiryyear.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

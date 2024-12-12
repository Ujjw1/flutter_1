import 'package:expanses_tracker/util/smart_device_box.dart';
import 'package:flutter/material.dart';

class Tracker extends StatefulWidget {
  const Tracker({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  List mySmartDevices = [
    ["Smart Light", "images/bulb.png", true],
    ["Smart Fan", "images/fan.png", false],
    ["Smart TV", "images/Tv.png", false],
    ["Smart AC", "images/Ac.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/dot.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  const Icon(Icons.person),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome To'),
                  Text(
                    'Ujjwal Shrivastav',
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text('Smart Devices'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return Mysmartdevice(
                    smartDevicename: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    poweron: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

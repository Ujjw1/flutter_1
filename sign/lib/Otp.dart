// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpMask extends StatelessWidget {
  const OtpMask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(150.0), // Set preferred height here
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 248, 252, 254),
          centerTitle: true,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 103, 102, 106),
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  OtpTextField(
                    fillColor: Colors.white,
                    numberOfFields: 5,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Send Again',
                      style: TextStyle(
                        color: Color.fromARGB(255, 222, 207, 211),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement your confirm logic here
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.pink,
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

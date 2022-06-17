import 'package:flutter/material.dart';

class PhoneSign extends StatelessWidget {
  PhoneSign({Key? key}) : super(key: key);

  TextEditingController userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          SizedBox(
            // width: 350,
            // height: 0,
            child: Image.asset(
              'assets/company_logo.png',
              width: 300,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 180),
            child: Text('- Desgined by grover'),
          ),
          const SizedBox(height: 80),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: userController,
                decoration: const InputDecoration(label: Text('Username')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

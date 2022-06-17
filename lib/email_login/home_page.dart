import 'package:auth/email_login/sigin_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alemeno'),
        centerTitle: false,
      ),
      body: ListView(children: [
        Column(
          children: [
            SizedBox(height: 50),
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 5),
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}

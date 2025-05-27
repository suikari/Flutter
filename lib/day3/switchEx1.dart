import 'package:flutter/material.dart';

void main() {
  runApp(const switchEx1());
}

class switchEx1 extends StatefulWidget {
  const switchEx1({super.key});

  @override
  State<switchEx1> createState() => _switchEx1State();
}

class _switchEx1State extends State<switchEx1> {
  bool isSwitched = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Switch(value: isSwitched, onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });

              }),
            ),
            Text(isSwitched ? "켰다" : "껐다" ),
          ],
        ),
      ),
    );
  }
}




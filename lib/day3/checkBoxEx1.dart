import 'package:flutter/material.dart';

void main() {
  runApp(const checkBoxEx1());
}

class checkBoxEx1 extends StatefulWidget {
  const checkBoxEx1({super.key});

  @override
  State<checkBoxEx1> createState() => _checkBoxEx1State();
}

class _checkBoxEx1State extends State<checkBoxEx1> {
  bool isChecked = false;
  bool isCheckedOracle = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Column(
          children: [
            Row(
              children: [
                Checkbox(value: isChecked, onChanged: (value){
                  setState(() {
                    isChecked = value!;
                  });
                }),
                Text("java"),
                Checkbox(value: isCheckedOracle, onChanged: (value){
                  setState(() {
                    isCheckedOracle = value!;
                  });
                }),
                Text("Oracle"),
              ],
            ),
            Container(
            )
          ],
        ) ,
      )
    );
  }
}

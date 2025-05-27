import 'package:flutter/material.dart';

void main() {
  runApp(const radioEx1());
}

class radioEx1 extends StatefulWidget {
  const radioEx1({super.key});

  @override
  State<radioEx1> createState() => _radioEx1State();
}

class _radioEx1State extends State<radioEx1> {
  String selectItem = "Java";
  Map<String, String> map = {};
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home : Scaffold(
        body : Column(
          children: [
            ListTile(
              leading: Radio(value: "Java", groupValue: selectItem, onChanged: (value){
                setState(() {
                  selectItem = value!;
                });
              }),
              title : Text("자바"),
            ),
            ListTile(
              leading: Radio(value: "Oracle", groupValue: selectItem, onChanged: (value){
                setState(() {
                  selectItem = value!;
                });
              }),
              title : Text("오라클"),
            ),
            ListTile(
              leading: Radio(value: "Html", groupValue: selectItem, onChanged: (value){
                setState(() {
                  selectItem = value!;
                });
              }),
              title : Text("HTML"),
            ),
            Text("선택 과목 : $selectItem"),
          ],
        ),
      )
    );
  }
}

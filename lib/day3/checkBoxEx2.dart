import 'package:flutter/material.dart';

void main() {
  runApp(const checkBoxEx2());
}


class checkBoxEx2 extends StatefulWidget {
  const checkBoxEx2({super.key});

  @override
  State<checkBoxEx2> createState() => _checkBoxEx2State();
}

class _checkBoxEx2State extends State<checkBoxEx2> {
  List<String> checkedList = [];
  List<String> imgList = [
    "img1.jpg",
    "img2.jpg",
    "img3.jpg",
  ];

  void listChanged( String path , bool isChecked ) {
    setState(() {
      if(isChecked) {
        checkedList.add(path);
      } else {
        checkedList.remove(path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Column(
          children: [
            ListTile(
              title : Text("자바"),
              leading: Checkbox(value: checkedList.contains(imgList[0]), onChanged: (value) {
                listChanged(imgList[0],value!);
              }),
            ),
            ListTile(
              title : Text("오라클"),
              leading: Checkbox(value: checkedList.contains(imgList[1]), onChanged: (value) {
                listChanged(imgList[1],value!);
              }),
            ),
            ListTile(
              title : Text("HTML"),
              leading: Checkbox(value: checkedList.contains(imgList[2]), onChanged: (value) {
                listChanged(imgList[2],value!);
              }),
            ),
            Expanded(
              child:
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 열의 개수
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: checkedList.length,
                itemBuilder: (context, index) {
                  return Image.asset(checkedList[index]);
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            )

          ],
        )
      )
    );
  }
}

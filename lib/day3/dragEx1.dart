import 'package:flutter/material.dart';

void main() {
  runApp(const dragEx1());
}

class dragEx1 extends StatefulWidget {
  const dragEx1({super.key});

  @override
  State<dragEx1> createState() => _dragEx1State();
}

class _dragEx1State extends State<dragEx1> {
  Offset position = Offset(100, 100); //좌표 관리 오브젝트 (x,y)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Stack(
          children: [
            Positioned(
              left: position.dx ,
              top : position.dy,

              child:  GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    position = details.globalPosition;
                  });
                },
                child: Container(
                    width : 100, height : 100, color: Colors.blue[100],
                    child: Center(child : Text("박스!"),
                  ),
                ),
              ),
            )

          ],
        )
      )
    );
  }
}

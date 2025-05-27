import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const dragEx2());
}

class dragEx2 extends StatefulWidget {
  const dragEx2({super.key});

  @override
  State<dragEx2> createState() => _dragEx2State();
}

class _dragEx2State extends State<dragEx2> {
  Offset position = Offset(100, 100); //좌표 관리 오브젝트 (x,y)
  double boxSize = 100;
  double appboxSize = 50;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
        home : Scaffold(
            appBar:AppBar(
                title : Text("제목"),
                 toolbarHeight: appboxSize,
            ),

            body : Stack(
              children: [
                Positioned(
                  left: position.dx ,
                  top : position.dy,
                  child:  GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        double x = position.dx + details.delta.dx;
                        double y = position.dy + details.delta.dy;

                        x = x.clamp(0.0, screenSize.width-boxSize);
                        y = y.clamp(0.0, screenSize.height-boxSize-appboxSize);

                        position = Offset(x, y);
                      });
                    },
                    child: Container(
                      width : boxSize, height : boxSize, color: Colors.blue[100],
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

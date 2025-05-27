import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const randomEx1());
}

class randomEx1 extends StatefulWidget {
  const randomEx1({super.key});

  @override
  State<randomEx1> createState() => _randomEx1State();
}

class _randomEx1State extends State<randomEx1> {
  Random ran = Random();
  List<Widget> list = [];

  Offset generatePosition( double width, double height ){
    double x = ran.nextDouble() * (width-35);
    double y = ran.nextDouble() * (height-35);

    return Offset(x, y);
  }


  void createList(){
    List<Widget> tempList = [];
    int count = 0;

    double width = MediaQuery.of(context).size.width;
    double height   =  MediaQuery.of(context).size.height;

    for(int i=0;i<10;i++){
      Offset position = generatePosition(width, height);
      tempList.add(
          Positioned(
              left : position.dx,
              top  : position.dy,
              child: GestureDetector(
                onTap : () {

                  setState(() {
                    if (count == i) {
                      list.removeAt(0);
                      count++;
                    }

                    if (list.length == 0) {
                      count = 0;
                      createList();
                    }
                  });
                },
                child: Container(
                  width: 35,
                  height: 35,
                  color: Colors.blue[100],

                  child: Center(child:Text((i+1).toString()),
                  ),

                ),
              )
          )
      );
    }

    setState(() {
      list = tempList;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((_){
      createList();

    },);


  }

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      home : Scaffold(
        body : Stack(
          children: list,
        )
      )
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Example',
      home: DialogEx1(),
    );
  }
}

class DialogEx1 extends StatefulWidget {
  const DialogEx1({super.key});

  @override
  State<DialogEx1> createState() => _DialogEx1State();
}

class _DialogEx1State extends State<DialogEx1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("다이얼로그")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Hello"),
                content: Text("정말 삭제하시겠습니까?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      // 삭제 동작
                      Navigator.of(context).pop();
                    },
                    child: Text("삭제", style: TextStyle(color: Colors.red)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("취소"),
                  ),
                ],
              );
            },
          ),
          child: Text("클릭!"),
        ),
      ),
    );
  }
}

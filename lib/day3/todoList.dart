import 'package:flutter/material.dart';

void main() {
  runApp(const todoList());
}

class todoList extends StatefulWidget {
  const todoList({super.key});

  @override
  State<todoList> createState() => _todoListState();
}




class _todoListState extends State<todoList> {
  final TextEditingController todoController = TextEditingController();
  List<String> textList = [];
  List<String> checkedList = [];

  void listChanged( String path , bool isChecked ) {
    setState(() {
      if(isChecked) {
        checkedList.add(path);
      } else {
        checkedList.remove(path);
      }
    });
  }

  void listDelete( int index ) {
    setState(() {
      textList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(title: Center(child: Text("할 일 목록"),),),
        body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: InputDecoration(
                          labelText: '할 일을 입력하세요',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          textList.add(todoController.text);
                          todoController.clear();
                        });
                        // 입력 버튼 클릭 시 동작
                      },
                      child: Text("입력"),
                    ),
                  ],
                ),
              ),
              if (textList.isNotEmpty)
                for(int i=0;i<textList.length;i++)
                ListTile(
                  title: Text(textList[i]),
                  leading: Checkbox(
                    value: checkedList.contains(textList[i]),
                    onChanged: (value) {
                      listChanged(textList[i], value!);
                    },
                  ),
                  trailing: IconButton(onPressed: (){
                    listDelete(i);
                  }, icon: Icon(Icons.delete_forever_outlined)),
                ),
            ]


        ),
      )

    );
  }
}


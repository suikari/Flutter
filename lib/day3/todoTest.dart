import 'package:flutter/material.dart';

void main() {
  runApp(const todoTest());
}


class todoTest extends StatelessWidget {
  const todoTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoManager(),
    );
  }


}

class ToDoManager extends StatefulWidget {
  const ToDoManager({super.key});

  @override
  State<ToDoManager> createState() => _ToDoManagerState();
}

class _ToDoManagerState extends State<ToDoManager> {
  TextEditingController txtCtrl = TextEditingController();
  List<Map<String, Object>> list = [];

  void addToDo () {
    String title = txtCtrl.text;

    setState(() {
      list.add({ "title": title , "isDone" : false });
      txtCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title : Text("할일"), centerTitle: true,),
      body : Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextField(
                    controller: txtCtrl,
                    decoration: InputDecoration( 
                      hintText: "할 일 입력",

                    ),
                  )
              ),
              ElevatedButton(onPressed: (){
                addToDo();
                }, child: Text('추가')
              )
            ],
          ),
          Expanded(
              child: list.isNotEmpty ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder : (context, index){
                    Map item = list[index];

                    return ListTile(
                      title : Text(item["title"] , style: TextStyle( decoration: item["isDone"] ? TextDecoration.lineThrough : null ),),
                      leading: Checkbox(value: item["isDone"], onChanged: (value){
                        setState(() {
                          item["isDone"] = value;
                        });
                      } ),
                      trailing: IconButton.outlined(onPressed: (){}, icon: Icon(Icons.delete_forever)),
                    );
                  },)
               :  Center(child: Text("할 일 없음"),)
          )
        ],
      )

    );
  }
}

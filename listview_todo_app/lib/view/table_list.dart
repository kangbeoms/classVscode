




import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/view/dataill_list.dart';

import '../model/todo_list.dart';



class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {

  late List<TodoList> todoList;



  @override
  void initState() {
    
    super.initState();
    todoList = [];
    addData();


  }
  
  

addData() {
  todoList.add(TodoList(imagesPath: 'images/cart.png', workList: '책 구매'));
  todoList.add(TodoList(imagesPath: 'images/clock.png', workList: '철수와 약속'));
  todoList.add(TodoList(imagesPath: 'images/pencil.png', workList: '스터디 준비하기'));
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('main view'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insert').then((value) => rebuildDAta());
            },
            icon: const Icon(Icons.add_outlined),
            )
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
              child: Dismissible(
                direction: DismissDirection.endToStart,
                key: ValueKey(todoList[index]),
                onDismissed: (direction) {
                  todoList.remove(todoList[index]);
                  setState(() {});
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete_forever,
                    size: 50,
                  ),
                  ),
                child: GestureDetector(
                  onTap: () {
                
                    Message.workList = todoList[index].workList;
                    Message.imageList = todoList[index].imagesPath;
                    Navigator.push(
                      context,
                        MaterialPageRoute(
                        builder: (context) => const DetailList()
                        ),
                        );
                  },
                  child: Card(
                    color: index % 2 == 0 ?
                    Colors.amber : 
                    Colors.blue
                    ,
                    child: Row(
                      children: [
                        Image.asset(
                          todoList[index].imagesPath,
                          width: 100,
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            todoList[index].workList
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          ),
      ),
    );
  }

rebuildDAta() {
  if(Message.action == true) {
  todoList.add(TodoList(imagesPath: Message.imageList, workList: Message.workList));
  Message.action = false;
  setState(() { });
  }

}


}
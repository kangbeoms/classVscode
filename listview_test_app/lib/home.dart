import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

late List<int> todoList;
late List<String> todoList2;

@override
  void initState() {
    super.initState();

    todoList = [];
    todoList2 = [];
    addData();
  }

  addData() {
    for(int i =1; i <=1000; i++) {
      todoList.add(i);
    }

    todoList2.add('james');
    todoList2.add('dfdf');
    todoList2.add('grehef');
    todoList2.add('jhthte');
    todoList2.add('jrn');
    todoList2.add('yhrtat');
    todoList2.add('ldfs');
    todoList2.add('ndfntnt');
    todoList2.add('jafh');
    todoList2.add('hfhhfhes');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main view'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList2.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 70,
              child: Card(
                color: Colors.blueGrey,
                child: Center(
                  child: Text(
                    todoList2[index],
                    style: const TextStyle(
                      fontSize: 20
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
}
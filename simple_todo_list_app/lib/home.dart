import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:simple_todo_list_app/database_handler.dart';
import 'package:simple_todo_list_app/savelist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler handler;
  late DateTime dateTime;
  late TextEditingController textEditingController;
  late String cleanDate;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    handler = DatabaseHandler();
    dateTime = DateTime.now();

    cleanDate =
        ('${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
              onPressed: () {
                showAlert();
              },
              icon: const Icon(Icons.add_outlined))
        ],
      ),
      body: FutureBuilder(
        future: handler.queryTodoList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Slidable(
                  startActionPane: ActionPane(motion: const BehindMotion(), children: [
                    SlidableAction(
                      backgroundColor: Colors.red.shade400,
                          icon: Icons.delete,
                          label: 'Delete',
                      onPressed: (context) {
                            goDelete();
                            reloadData();
                            
                      },
                      )
                  ]),
                  child: Card(
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        Text(snapshot.data![index].title),
                        Text(' / '),
                        Text(cleanDate)
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  showAlert() {
    Get.dialog(AlertDialog(
      title: const Text("Todo List"),
      content: const Text("추가할 내용을 입력하세요."),
      actions: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(labelText: '추가할 내용'),
                keyboardType: TextInputType.text,
              ),
            ),
            TextButton(
              onPressed: ()  {
                insertAction();
                // reloadData();
                textEditingController.text = "";
                Get.back();
              },
              child: const Text('추가하기'),
            ),
          ],
        )
      ],
    ));
  }

  insertAction() {
    handler.insertlist(SaveList(
        title: textEditingController.text.toString(),
        date: cleanDate.toString()));
    setState(() {});
  }

  reloadData() {
    handler.queryTodoList();
    setState(() {});
  }

  goDelete() {
    
  }
}

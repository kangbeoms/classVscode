import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:text_sql_app/view/database_handler.dart';
import 'package:text_sql_app/view/insert.dart';
import 'package:text_sql_app/view/update.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite for Students'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const InsertStudents())!
                  .then((value) => reloadData());
            },
            icon: const Icon(Icons.add_outlined),
          )
        ],
      ),
      body: FutureBuilder(
        future: handler.queryStudents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => const UpdateStudents(), arguments: [
                      snapshot.data![index].code,
                      snapshot.data![index].name,
                      snapshot.data![index].dept,
                      snapshot.data![index].phone,
                      snapshot.data![index].image
                    ])!
                        .then((value) => reloadData());
                  },
                  child: Slidable(
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red.shade400,
                          icon: Icons.delete,
                          label: 'Delete',
                          onPressed: (context) {
                              goDelete(snapshot.data![index].id);
                          },
                          ),
                      ]),
                    child: Card(
                      child: Row(
                        children: [
                          Image.memory(
                            snapshot.data![index].image,
                            width: 100,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Code :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(snapshot.data![index].code)
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Name :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(snapshot.data![index].name)
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Dept :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(snapshot.data![index].dept)
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Phone :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(snapshot.data![index].phone)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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

  // —— function ———

goDelete(id) {
    handler.deleteStudents(id);
    setState(() {});
}






  reloadData() {
    handler.queryStudents();
    setState(() {});
  }
}

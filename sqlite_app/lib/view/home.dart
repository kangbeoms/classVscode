import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/view/insert.dart';
import 'package:sqlite_app/view/update.dart';
import 'package:sqlite_app/viewmodel/database_handler.dart';


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
                    Get.to(const UpdateStudents(), arguments: [
                      snapshot.data![index].code,
                      snapshot.data![index].name,
                      snapshot.data![index].dept,
                      snapshot.data![index].phone,
                    ])!
                        .then((value) => reloadData());
                  },
                  child: Card(
                    child: Column(
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

  reloadData() {
    handler.queryStudents();
    setState(() {});
  }
}

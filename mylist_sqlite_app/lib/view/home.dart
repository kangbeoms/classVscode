
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/view/insert.dart';
import 'package:test_app/view/map_gps.dart';
import 'package:test_app/view_model.dart/database_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DatabaseHandler databaseHandler;

  @override
  void initState() {
    super.initState();
    databaseHandler = DatabaseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내가 경험한 맛집 리스트'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const Insert());
              },
              icon: const Icon(Icons.edit_note_outlined)),
        ],
      ),
      body: FutureBuilder(
        future: databaseHandler.queryList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
              
                return GestureDetector(
                  onTap: () {
                    Get.to(const MapGps(), arguments: [
                          snapshot.data![index].lat,
                          snapshot.data![index].lng,
                          snapshot.data![index].name,
                          


                    ]);
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Column(
                          children: [Image.memory(snapshot.data![index].image as Uint8List)],
                        ),
                        Column(
                          children: [
                            Text('명칭: ${snapshot.data![index].name}'
                                '\n\n전화번호: ${snapshot.data![index].phone}')
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

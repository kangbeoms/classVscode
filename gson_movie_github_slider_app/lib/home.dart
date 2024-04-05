import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/route_manager.dart';
import 'package:gson_movie_github_slider_app/edit.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];
    data.addAll(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON & Slider Test'),
      ),
      body: Center(
          child: data.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      startActionPane:
                          ActionPane(motion: const BehindMotion(), children: [
                        SlidableAction(
                          backgroundColor: Colors.green,
                          icon: Icons.edit,
                          label: 'Edit',
                          onPressed: (context) {
                                  Get.to(
                                    const Edit(),
                                    arguments: [
                                      data[index]['image'],
                                      data[index]['title']
                                    ]
                                  )!.then((value) => rebuildData(index, value));

                          },
                        ),
                      ]),
                      endActionPane:
                          ActionPane(motion: const BehindMotion(), children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: '삭제',
                          onPressed: (context) {
                            selectDelete(index);
                          },
                        ),
                      ]),
                      child: Card(
                        color: index % 2 == 0
                            ? Theme.of(context).colorScheme.secondaryContainer
                            : Theme.of(context).colorScheme.tertiaryContainer,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                data[index]['image'],
                                width: 80,
                              ),
                            ),
                            Text(
                              "   ${data[index]['title']}",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  fontSize: 15
                                  ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),
    );
  }

  selectDelete(index) {
      showCupertinoModalPopup(
        context: context,
        barrierDismissible: false, 
        builder: (context) => CupertinoActionSheet(
          title: const Text('경고'),
          message: const Text('선택한 항목을 삭제 하시겠습니까?'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                data.removeAt(index);
                setState(() { });
                Get.back();
              },
              child: const Text('삭제'),
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Get.back(), 
            child: const Text('Cancel')
            ),
        ),
          
        );
  }

  rebuildData(index , String str) {
    if (str.isNotEmpty) {   
      data[index]['title'] = str;
      setState((){});
    }
  }
}

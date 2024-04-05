import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  late int page;
  late String what;
  late ScrollController _scrollController;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    data = [];
    page = 1;
    what = '';
    textEditingController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      // 리스트의 마지막일 경우
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        page++;
        getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[40],
        toolbarHeight: 90,
        title: TextField(
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: '검색어를 입력하세요.',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.text,
        ),
      ),
      body: Center(
          child: data.isEmpty
              ? const Text(
                  '데이터가 없다',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              : ListView.builder(
                  itemCount: data.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: [
                          Image.network(
                            data[index]['thumbnail'],
                            height: 100,
                            width: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data[index]['title'].toString().length < 26
                                  ? Text(data[index]['title'].toString())
                                  : Text(data[index]['title']
                                      .toString()
                                      .replaceRange(
                                          26,
                                          data[index]['title']
                                              .toString()
                                              .length,
                                          "...")),
                              Text(data[index]['price'].toString()),
                              Text(data[index]['status'].toString()),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )
                ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          if (textEditingController.text.trim().isNotEmpty) {
            page = 1;
            data.clear();
            what = textEditingController.text.trim();
            getJSONData();
          } else {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  backgroundColor: Colors.amber,
                  title: const Text('알림'),
                  content: const Text('검색어를 입력하세요.'),
                  actions: [
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('예'),
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        child: const Icon(Icons.file_download),
      ),
    );
  }

// Function -------
  getJSONData() async {
    var uri = Uri.parse(
        "https://dapi.Kakao.com/v3/search/book?target=title&page=$page&query=$what");
    var response = await http.get(uri,
        headers: {"Authorization": "KakaoAK a87733e17c0dabdd05f287a5aab376b6"});
    print(response.body);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['documents'];
    data.addAll(result);
    setState(() {});
  }
}

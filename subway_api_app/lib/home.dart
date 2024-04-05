import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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
  late String searchWhat;

  @override
  void initState() {
    super.initState();
    data = [];
    page = 1;
    what = '';
    searchWhat = '강남';
    textEditingController = TextEditingController();
    _scrollController = ScrollController();
        getJSONData();
    _scrollController.addListener(() {
      // 리스트의 마지막일 경우
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        page++;
         //getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.red[400],
          toolbarHeight: 120,
          title: Column(
            children: [
              const Text('Seoul Subway'),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: '검색어를 입력하세요.',

                  ),
                      textInputAction: TextInputAction.go,
                onSubmitted: (value) {
                  if(textEditingController.text.isEmpty) {
                      errorSnackbar();
                  }else {
                    searchWhat = textEditingController.text;
                    data = [];
                    getJSONData();
                  
                  }
                },
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  IconButton(onPressed: () {
                        if(textEditingController.text.isEmpty) {
                      errorSnackbar();
                  }else {
                    searchWhat = textEditingController.text;
                    data = [];
                    getJSONData();
                  
                  }
                  }, icon: const Icon(Icons.search)),
            )
          ],
        ),
        body: Center(
            child: data.isEmpty
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: data.length,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          children: [
                            const Padding(
                              
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                
                                children: [
                                  Text(
                                    '열차 구분: ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('열차 방면: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text('현재 위치: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text('도착 시간: ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(data[index]['updnLine']),
                              Text(data[index]['trainLineNm']),
                              Text(data[index]['arvlMsg3']),
                              Text(data[index]['arvlMsg2']),
                            ]
                            ),
                          ],
                        ),
                      );
                    },
                  )),
      ), 
    );
  }

// Function -------
  getJSONData() async {
    var uri = Uri.parse(
        "http://swopenapi.seoul.go.kr/api/subway/617869757674767a34336c6a6a4d75/json/realtimeStationArrival/1/50/$searchWhat");
    var response = await http
        .get(uri, headers: {"Authorization": "617869757674767a34336c6a6a4d75"});
    print(response.body);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['realtimeArrivalList'];
    data.addAll(result);
    setState(() {});
  }





  errorSnackbar() {
        Get.snackbar('경고', '검색어를 입력하세요.',
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP);
  }

  showSnackbar() {
    
  }
}

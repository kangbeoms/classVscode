import 'dart:convert';

import 'package:crud_app/insert.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    data = [];
    getJSONData();
  }

  getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/JSP/student_query_flutter.jsp');
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
          toolbarHeight: 100,
          title: Column(
            children: [
            const Text('CRUD for Students'),
              TextField(
                  controller: textEditingController,
                    keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                onSubmitted: (value) {
                  if(textEditingController.text.isEmpty) {
                      errorSnackbar();
                  }else {

                    
                  }
                },
              )
            ],
          ),
          
          
          actions: [
            IconButton(
              onPressed: () {
                  Get.to(const Insert())!.then((value) => returnValue());
              },
              icon: const Icon(Icons.edit))
          ],
        ),
        body: Center(
          child: data.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => cardBuild(context, index),
                ),
        ));
  }

  Widget cardBuild(BuildContext context, int index) {
    return Card(
      child: Row(
        children: [
          const Column(
            children: [
              Text(
                'Code :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Name :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Dept :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Phone :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: [
              Text(data[index]['code'].toString()),
              Text(data[index]['name'].toString()),
              Text(data[index]['dept'].toString()),
              Text(data[index]['phone'].toString()),
            ],
          )
        ],
      ),
    );
  }

  errorSnackbar() {
     Get.snackbar('경고', '글자를 입력하세요.',
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black45,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP);
  }

  returnValue() {
    data = [];
    getJSONData();
    setState(() {});
  }
}

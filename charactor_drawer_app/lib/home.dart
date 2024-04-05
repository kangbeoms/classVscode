import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;
  late String viewText;
  late List text;
  late int textNum;

  @override
  void initState() {
    super.initState();
    viewText = "Hello";
          
    textNum = 0;
    textEditingController = TextEditingController();
    text = viewText.split('');
    viewText = text[textNum];

    Timer.periodic(const Duration(seconds: 1), (timer) {
      textView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewText,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(children: [
           const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('광고 문구를 입력하세요.')],
              ),
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: TextField(
              controller: textEditingController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                label: Text('글자를 입력하세요.'),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Get.back();
                viewText = '';
                text = textEditingController.text.split('');
                textNum = 0;
                setState(() {});
              },
              child: const Text('ok'))
        ]),
      ),
    );
  }

  textView() {
    textNum++;

    if (textNum >= text.length) {
      textNum = 0;
      viewText = text[textNum];
    } else {
      viewText += text[textNum];
    }
    setState(() {});
  }
}

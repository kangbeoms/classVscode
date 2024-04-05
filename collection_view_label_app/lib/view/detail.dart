import 'package:collection_view_label_app/model/savedate.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('항목 보기'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
        body: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(SaveData.text)
            ],
            ),
        ),
    );
  }
}
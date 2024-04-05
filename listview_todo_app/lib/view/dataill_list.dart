import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class DetailList extends StatefulWidget {
  const DetailList({super.key});

  @override
  State<DetailList> createState() => _DatailListState();
}

class _DatailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datail view'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(Message.imageList),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(Message.workList),
            ),
          ],
        ),
      ),
    );
  }
}

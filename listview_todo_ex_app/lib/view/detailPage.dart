import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datail view'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Message.image
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Message.text
                ),
              )
            ],
            ),
        ),
    );
  }
}
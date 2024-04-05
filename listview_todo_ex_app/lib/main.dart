import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/view/detailPage.dart';
import 'package:listview_todo_ex_app/view/insertPage.dart';

import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/':(context) => const Home(),
        '/detail':(context) => const DetailPage(),
        '/insert':(context) => const InsertPage(),
      },
    );
  }
}


import 'package:flutter/material.dart';

import 'view/Home.dart';
import 'view/screen1.dart';
import 'view/screen1image.dart';
import 'view/screen2.dart';
import 'view/screen2image.dart';

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
       initialRoute: '/',
      routes: {
        '/' : (context) => const Home(),
        '/1st' : (context) => const screen1(),
        '/2nd' :(context) => const screen2(),
        '/1stI' :(context) => const screen1image(),
        '/2ndI' :(context) => const screen2image(),

        
      },
    );
  }
}


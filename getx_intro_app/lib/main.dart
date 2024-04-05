import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro_app/third_page.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
      getPages: [
        GetPage(
         name: '/third',
         page: () =>  const ThirdPage(),
         transition: Transition.circularReveal,
         transitionDuration: const Duration(seconds: 2)
         ),
         GetPage(
         name: '/third2',
         page: () =>  const ThirdPage(),
         
         ),
      ],
    );
  }
}


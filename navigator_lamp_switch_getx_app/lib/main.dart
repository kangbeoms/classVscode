import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigator_lamp_switch_getx_app/controller.dart';

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
      home: const Home(imageD: ),
      getPages: [
        GetPage(
            name: '/con',
            page: () => const Controller(),
            
            transitionDuration: const Duration(seconds: 1)
            ),
            
      ],
    );
  }
}

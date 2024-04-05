import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //Property
  
    var value = Get.arguments ?? "__";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>  Get.back(), 
             child: const Text('Exit')
             ),
             Text(
                "Single Arguments : $value"
             ),
              Text('Multiple Arguments #1 : ${value[0]}'),
            Text('Multiple Arguments #1 : ${value[1]}'),
            ElevatedButton(
              onPressed: () =>  Get.back(result: "Good"),
            child: const Text('Reply'))

          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  late String saveFile;


  @override
  void initState() {
    super.initState();
    saveFile = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('꽃꽃'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                  ClipRRect(
                     borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      saveFile
                      ,
                      width: 300,
                      height: 500,
                      fit: BoxFit.fill,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
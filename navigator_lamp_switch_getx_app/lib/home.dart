import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  final String imageD;
  const Home({super.key, required this.imageD});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //late String image;
  late String imageD = Get.arguments ?? "images/lamp_on.png";

  late String whatImage;
  //late String imageD;
@override
  void initState() {
    super.initState();
    //image = 'images/lamp_on.png';
    whatImage = '';
    imageD = '';
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        actions: [
          IconButton(
          onPressed: () => Get.toNamed('/con'),
          icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset(
                imageD,
                width: 200,
                height: 350,
              )
          ],
        ),
      ),
      
    );
  }
}  
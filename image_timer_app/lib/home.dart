import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List imageName;
  // Image 배열 현재 번호
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01',
      'flower_02',
      'flower_03',
      'flower_04',
      'flower_05',
      'flower_06',
    ];

    currentImage = 0;

  // Timer 설치 
    Timer.periodic(const Duration(seconds: 2), (timer) {
        changeImage();
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초마다 이미지 무한 반복')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                  '${imageName[currentImage]}.png',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'images/${imageName[currentImage]}.png',
                width: 400,
              
              ),
            )
          ],
          ),
      ),
    );
  }



  // Function ------

  changeImage() {
    currentImage++;
    if(currentImage >= imageName.length) {
      currentImage = 0;
    }
    setState(() {});
  }
}
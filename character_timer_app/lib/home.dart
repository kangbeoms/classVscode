

import 'dart:async';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    // 배열값
    late List text;
    // 출력할 텍스트값
    late String kor;
    // 배열의 순서값
    late int TextNum;


  @override
  void initState() {
    super.initState();

    String data = '대한민국';
    // split 을 사용하면 string 값을 배열로 바꾸어준다
  text = data.split('');
    TextNum = 0;
    kor = text[TextNum];

      // Timer 설치 
    Timer.periodic(const Duration(seconds: 2), (timer) { 
              viewText();
    });
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LED 광고')
      
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Text('$kor'),
          ],
        ),
      ),
    );
  }

  //Function --------

  viewText() {

        TextNum ++;
  
        if (TextNum >= text.length ) {
          TextNum = 0;
          kor = text[TextNum];
        }else {
          kor += text[TextNum];
        }
        setState(() {});
  }
  
}
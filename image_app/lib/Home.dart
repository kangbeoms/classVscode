import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // appbar 는 바디위에 떠있다
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
      title: const Text('Tmage Test'),
      backgroundColor: Colors.brown,
      ),
      // 스크롤바 만들기
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset(
              'images/smail.png',
              width: 150,
              height: 150,
              
          ),
            Image.asset(
              'images/smail.png',
              width: 50,
              height: 100,
              // 내가 지정한 값에 맞춘다
              fit: BoxFit.fill,
              
          ),
            Image.asset(
              'images/smail.png',
              width: 150,
              // 기본값이 컨테인
              fit: BoxFit.contain,
              
          ),
            Image.asset(
              'images/smail.png',
              width: 50,
              fit: BoxFit.cover,
                
          ),
            Image.asset(
              'images/smail.png',
              width: 150,
              
          ),
            Image.asset(
              'images/smail.png',
              width: 150,
              
          ),
            Image.asset(
              'images/smail.png',
              width: 150,
              
          ),
            Image.asset(
              'images/smail.png',
              width: 150,
              
          ),
            Image.asset(
              'images/smail.png',
              width: 150,
              
          ),
            Image.asset(
              'images/smail.png',
              width: 150,
              
          ),
            Image.asset(
              'images/smail.png',
              width: 150,
              
          ),
          ],
          ),
        ),
      ),
    );
  }
}
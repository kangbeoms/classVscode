import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //  app bar 와 body 를 관리하는 위젯
    return Scaffold(
      // flutter 는 모든게 
      appBar: AppBar(
        title: const Text(
          '삼국지'
          ),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          foregroundColor: const Color.fromARGB(255, 43, 31, 45),

      ),
      body: const Center(
        // 센터는 하나만 존재할수 있다 
        // 컬럼으로 감싸주면 많은 센터를 줄수있다 컬럼은 배열값으로 존재

        child: Column(
          // 주축정렬
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("유비"),
            // 줄띄기
            SizedBox(
              height: 50,
            ),
            Text("관우"),
            Text("장비"),

          ],
        )
        ),

    );
  }
}
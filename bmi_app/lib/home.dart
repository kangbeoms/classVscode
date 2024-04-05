import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late String resultText;
  late String what;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    resultText = "";
    what = "";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI 계산기'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: num1Controller,
                decoration: const InputDecoration(
                    labelText: '신장을 입력하세요(단위 :cm)',
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: num2Controller,
                decoration: const InputDecoration(
                    labelText: '몸무게를 입력하세요(단위: kg)',
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => calc(),
                child: const Text('BMI 계산'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              resultText,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  calc() {
    setState(() {});
    int num1 = int.parse(num1Controller.text.trim());
    int num2 = int.parse(num2Controller.text.trim());

    double bmi = double.parse((num2 / ((num1 / 100) * 2)).toStringAsFixed(1));

    if (bmi <= 18.4) {
      what = '저체중';
    }
    if (bmi >= 18.5 && bmi <= 22.9) {
      what = '정상체중';
    }
    if (bmi >= 23 && bmi <= 24.9) {
      what = '과체중';
    }
    if (bmi >= 25 && bmi <= 29.9) {
      what = '비만';
    }
    if (bmi >= 30) {
      what = '고도비만';
    }
    resultText = ('BMI 계수는 $bmi 이고 $what 입니다.');
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Property
  late FixedExtentScrollController fixedExtentScrollController1;
  late FixedExtentScrollController fixedExtentScrollController2;
  late int whatT;
  late int whatK;
  late String resultText;
  late String what;
  late Color whatYou1;
  late Color whatYou2;
  late Color whatYou3;
  late Color whatYou4;
  late Color whatYou5;

late List T;
late List K;

  @override
  void initState() {

    super.initState();
    K = [];
    T = [];
    addT();
    addK();
    fixedExtentScrollController1 = FixedExtentScrollController();
    fixedExtentScrollController2 = FixedExtentScrollController();
    whatT = 0;
    whatK = 0;
    resultText = "";
    what = "";
    whatYou1 = Colors.white;
    whatYou2 = Colors.white;
    whatYou3 = Colors.white;
    whatYou4 = Colors.white;
    whatYou5 = Colors.white;
  }

addT() {
  for(int i =100; i <=200; i++) {
    T.add(i);
  }
}
addK() {
   for(int i =30; i <=150; i++) {
    K.add(i);
  }
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI 계산기'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
                  Row(
            mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 200,
                        child: CupertinoPicker(
                          itemExtent: 30, 
                          
                          scrollController: FixedExtentScrollController(initialItem: 60),
                          onSelectedItemChanged: (value) {
                            whatT = value;
                             calc();
                            setState(() {});
                          }, 
                          children: List.generate(
                            
                            T.length , 
                            (index) => Center(
                              child: Text('${T[index]}'),
                            )
                            ),
                          ),
                      ),
                    SizedBox(
                      width: 150,
                      height: 200,
                      child: CupertinoPicker(
                          itemExtent: 30, 
                          scrollController: FixedExtentScrollController(initialItem: 30),
                          onSelectedItemChanged: (value) {
                            whatK = value;
                          calc();
                            setState(() {});
                          }, 
                          children: List.generate(
                            
                            K.length , (index) => Center(
                              child: Text('${K[index]}'),
                            )
                            ),
                          ),
                    ),
                    ],
                  ),
              
              const SizedBox(
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
              Row(
                children: [
                  const SizedBox(width: 20),
                  Icon(
                    Icons.arrow_downward,
                    size: 50,
                    color: whatYou1,
                  ),
                  const SizedBox(width: 35),
                  Icon(
                    Icons.arrow_downward,
                    size: 50,
                    color: whatYou2,
                  ),
                  const SizedBox(width: 35),
                  Icon(
                    Icons.arrow_downward,
                    size: 50,
                    color: whatYou3,
                  ),
                  const SizedBox(width: 35),
                  Icon(
                    Icons.arrow_downward,
                    size: 50,
                    color: whatYou4,
                  ),
                  const SizedBox(width: 35),
                  Icon(
                    Icons.arrow_downward,
                    size: 50,
                    color: whatYou5,
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'images/bmi.webp',
                    width: 400,
                    height: 200,
                    // 내가 지정한 값에 맞춘다
                    //fit: BoxFit.fill,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  calc() {
    setState(() {});
    // int num1 = int.parse(num1Controller.text.trim());
    // int num2 = int.parse(num2Controller.text.trim());
    
    double bmi = double.parse((whatT / ((whatK / 100) * 2)).toStringAsFixed(1));

    if (bmi <= 18.4) {
      what = '저체중';
      whatYou1 = Colors.black;
      whatYou2 = Colors.white;
      whatYou3 = Colors.white;
      whatYou4 = Colors.white;
      whatYou5 = Colors.white;
    }
    if (bmi >= 18.5 && bmi <= 22.9) {
      what = '정상체중';
      whatYou2 = Colors.black;
      whatYou1 = Colors.white;
      whatYou3 = Colors.white;
      whatYou4 = Colors.white;
      whatYou5 = Colors.white;
    }
    if (bmi >= 23 && bmi <= 24.9) {
      what = '과체중';
      whatYou3 = Colors.black;
      whatYou2 = Colors.white;
      whatYou1 = Colors.white;
      whatYou4 = Colors.white;
      whatYou5 = Colors.white;
    }
    if (bmi >= 25 && bmi <= 29.9) {
      what = '비만';
      whatYou4 = Colors.black;
      whatYou2 = Colors.white;
      whatYou3 = Colors.white;
      whatYou1 = Colors.white;
      whatYou5 = Colors.white;
    }
    if (bmi >= 30) {
      what = '고도비만';
      whatYou5 = Colors.black;
      whatYou2 = Colors.white;
      whatYou3 = Colors.white;
      whatYou4 = Colors.white;
      whatYou1 = Colors.white;
    }
    resultText = ('BMI 계수는 $bmi 이고 $what 입니다.');
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Color whatC;

 late String currentDateTime;
  DateTime? chosenDateTime;
  late bool _isRunning;
  late int alTime;

  @override
  void initState() {
    super.initState();
    currentDateTime = "";
    _isRunning = true;
    alTime = 0;
    whatC = Colors.white;


    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isRunning) {
        timer.cancel();
        
      }
      _additem();
     
    });
  }

  _additem() {
    final DateTime now = DateTime.now();
    currentDateTime =
        ('${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}${_weekdayToString(now.weekday)}${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}');
      alTime = now.second;
       alarmOn();
       //print(alTime);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whatC,
      appBar: AppBar(
        title: const Text('알람 정하기'),
      ),
      body: Center(
      
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(
              '현재시간 $currentDateTime',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
                      SizedBox(
                        width: 250,
                        height: 300,
                        child: CupertinoDatePicker(
                                  
                                        initialDateTime: DateTime.now(),
                                        use24hFormat: true,
                                        onDateTimeChanged: (value) {
                                          chosenDateTime = value;
                                          //print(chosenDateTime);
                                        },
                                        
                                      ),
                      ),
                Text(
              '선택시간 : ${chosenDateTime != null ? _chosenItem(chosenDateTime)! : '시간을 선택하세요.'} ',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }




  // --Function--
  String _weekdayToString(weekday) {
    String dateName = '';
    switch (weekday) {
      case 1:
        dateName = '월';
        break;

      case 2:
        dateName = '화';
        break;

      case 3:
        dateName = '수';
        break;

      case 4:
        dateName = '목';
        break;

      case 5:
        dateName = '금';
        break;

      case 6:
        dateName = '토';
        break;
      case 7:
        dateName = '일';
        break;
    }
    return dateName;
  }

  String _chosenItem(now) {
    String cho = ('${now.year.toString()}'
        '-${getPad(now.month)}'
        '-${getPad(now.day)}'
        '${_weekdayToString(now.weekday)}'
        '${getPad(now.hour)}'
        ':${getPad(now.minute)}');
    return cho;
  }
      
  String getPad(time) {
    String a = time.toString().padLeft(2, '0');
    return a;
  }

  alarmOn()  {
      if (currentDateTime.toString().substring(0,3) == chosenDateTime ) {
          
              
          // ? whatC = Colors.amber : whatC = Colors.deepOrangeAccent;
              if ( alTime % 2 == 0) {
                      whatC = Colors.amber;
              } else {
                whatC = Colors.deepOrangeAccent;
              }
        
      }else {
          whatC = Colors.white;
      }
  }
  

  
}
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

//Property
late List imageName;
  // Image 배열 현재 번호
  late int currentImage;



 late String _lampImage; // 파일 네임
late double _lampWidth; // 이미지 가로 크기
late double _lampHeight; // 이미지 상단크기
late String _buttonName; // 버튼 텍스트
late bool _switch;  // 스위치의 상태
late String _lampSizeStatus; // 현재 화면의 램프크기
late double _rotation; // 회전 각도


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lampImage = "images/lamp_on.png";
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = "이미지 확대";
    _switch = true;
    _lampSizeStatus = 'small';
    _rotation = 0;
  // Timer 설치 
    Timer.periodic(const Duration(milliseconds: 20), (timer) {
        changeImage();
      });
    Timer.periodic(const Duration(seconds: 3), (timer) { 
        page2Image();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image 확대 및 축소'),
      ),
      body: SimpleGestureDetector(
      
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center
            ,
            children: [
                SizedBox(
                  width: 300,
                  height: 580,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotationTransition(
                        turns: AlwaysStoppedAnimation(_rotation/360),
                        child: Image.asset(
                          _lampImage,
                          width: _lampWidth,
                          height: _lampHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => lampsize(),
                        
                    
                     child: Text(_buttonName)
                     ),
                     Column(
                      children: [
                        const Text(
                          '전구 스위치',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          ),
                          Switch(
                            value: _switch, 
                            onChanged: (value) {
                              _switch = value;
                              onoff();
                            },
                            )
                      ],
                     )
                  ],
                ),
                Container(
                  width: 300,
                  color: Colors.amber,
        
                  child: Slider(
                    value: _rotation, 
                    min: 0,
                    max: 360,
                   onChanged: (value) {
                     _rotation = value;
                     setState(() {});
                   },
                   ),
                ),
            ],
            ),
        ),
      )
    );
  }


  lampsize() {
    if (_lampSizeStatus == 'small') {
      _lampWidth =250;
      _lampHeight = 500;
      _buttonName = '이미지 축소';
      _lampSizeStatus = 'large';

    }else {
        _lampWidth = 150;
      _lampHeight = 300;
      _buttonName = '이미지 확대';
      _lampSizeStatus = 'small';
    }
    setState(() { });
  }

  onoff() {
    if(_switch) {
      _lampImage = "images/lamp_on.png";
    }else {
      _lampImage = "images/lamp_off.png";
    }
    setState(() { });
  }

  changeImage() {
      _rotation +=1;
      if(_rotation == 180 ) {
          _switch = false;
            _lampImage = "images/lamp_off.png";
      }
      if(_rotation == 1) {
         _switch = true;
            _lampImage = "images/lamp_on.png";
      }
      if(_rotation >= 360) {
        _rotation = 0;
      }
      setState(() {
        
      });
  }

  page2Image() {

  }
}
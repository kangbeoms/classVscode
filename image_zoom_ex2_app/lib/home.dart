import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _imageFileName;
  late double _lampWidth; // 이미지 가로 크기
  late double _lampHeight; // 이미지 상단크기
  late bool _buttonStatus1;
  late bool _buttonStatus2;
  late bool _buttonStatus3;
  late String lampColor;

  @override
  void initState() {
    super.initState();
    _imageFileName = "images/lamp_on.png";
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonStatus1 = true;
    _buttonStatus2 = true;
    _buttonStatus3 = true;
    lampColor = 'on';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image 확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _imageFileName,
              width: _lampWidth,
              height: _lampHeight,
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('전구 색깔'),
                      Switch(
                        value: _buttonStatus1,
                        // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                        onChanged: (value) {
                          _buttonStatus1 = value;
                          buttonColor();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('전구 확대'),
                      Switch(
                        value: _buttonStatus2,
                        // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                        onChanged: (value) {
                          _buttonStatus2 = value;
                          buttonUp();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('전구 스위치'),
                      Switch(
                        value: _buttonStatus3,
                        // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                        onChanged: (value) {
                          _buttonStatus3 = value;
                          buttonOn();
                        },
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  buttonColor() {
    if (_buttonStatus1 == false) {
      lampColor = 'red';
      _imageFileName = 'images/lamp_$lampColor.png';
    }
    if (_buttonStatus1 == true) {
      lampColor = 'on';
      _imageFileName = 'images/lamp_$lampColor.png';
    }

    setState(() {});
  }

  buttonUp() {
    if (_buttonStatus2 == true) {
      _lampWidth = 150;
      _lampHeight = 300;
    } else {
      _lampWidth = 250;
      _lampHeight = 350;
    }
    setState(() {});
  }

  buttonOn() {
    if (_buttonStatus3 == false) {
      lampColor = 'off';
      _imageFileName = 'images/lamp_$lampColor.png';
    } else {
      buttonColor();
    }
    setState(() {});
  }
}

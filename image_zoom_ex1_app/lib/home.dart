import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

    
 late String _lampImage; // 파일 네임
late double _lampWidth; // 이미지 가로 크기
late double _lampHeight; // 이미지 상단크기

late bool _switch;  //  확대스위치의 상태
late bool _switch2;  //  온오프스위치의 상태

late double _rotation; // 회전 각도


@override
  void initState() {
    // TODO: implement initState
    super.initState();

    _lampImage = "images/lamp_on.png";
    _lampWidth = 150;
    _lampHeight = 300;
    
    _switch = true;
    
    _rotation = 0;
    _switch2 = true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image 확대 및 축소'),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    Image.asset(
                          _lampImage,
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
                                Text('전구 확대'),
                                Switch(
                                value: _switch,
                                // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                                onChanged: (value) {
                                  _switch = value;
                                    upSize();
                                },
                                ),
                    
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('전구 스위치'),
                                Switch(
                                value: _switch2,
                                // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                                onChanged: (value) {
                                  _switch2 = value;
                                    onoff();
                                },
                                ),
                              ],
                            ),
                          )
                        ],
                              
                    ),
            ],
            ),
        ),
        
      ),
    );
  }


// Function ------

upSize() {
  if (_switch == true) {
      _lampWidth =250;
      _lampHeight = 350;
      
    }else {
        _lampWidth = 150;
      _lampHeight = 300;
     
    }
    setState(() { });
}


onoff() {
  if(_switch2) {
      _lampImage = "images/lamp_on.png";
    }else {
      _lampImage = "images/lamp_off.png";
    }
    setState(() { });
}




}
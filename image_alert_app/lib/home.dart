import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lampImage;
  late String _buttonState;
  //late bool _buttonState2;
  late String _alertTitle;
  late String _alertText;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _buttonState = 'on';
    _alertTitle = '경고';
    _alertText = '현재 램프가 켜진 상태 입니다.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert를 이용한 메세지 출력'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              _lampImage,
              width: 300,
              height: 550,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_buttonState == 'on') {
                          showOn(context);
                        } else {
                          showOff(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('켜기'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_buttonState == 'on') {
                          showOff(context);
                        } else {
                          showOn(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('끄기'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  onB() {
   
      _lampImage = 'images/lamp_on.png';
      _alertText = '램프를 끄시겠습니까?';
      _alertTitle = '램프 끄기';
      _buttonState = 'on';
    

    setState(() {});
  }

  offB() {
   
      _lampImage = 'images/lamp_off.png';
      _alertText = '현재 램프가 켜진 상태 입니다.';
      _alertTitle = '경고';
      _buttonState = 'off';
    
    setState(() {});
  }

  showOn(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(_alertTitle),
          content: Text(_alertText),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                Navigator.of(ctx).pop();
                onB();
                  
                }, 
                child: const Text('네 알갰습니다.'),
              ),
            )
          ],
        );
      },
    );
    setState(() {});
  }

  showOff(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text(_alertTitle),
          content: Text(_alertText),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    offB();
                  },
                  child: const Text('네'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('아니요'),
                ),
              ],
            ),
          ],
        );
      },
    );
    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:navigator_lamp_switch_getx_app/home.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {


  late bool _switchColor;
  late bool switchOn;

  late Color switch1;
  late Color switch2;
  late Color switch3;
  late Color switch4;

   late String imageD;

  @override
  void initState() {
    super.initState();

    _switchColor = true;

    switchOn = true;
imageD = ''; 
    switch1 = Colors.white;
    switch2 = Colors.black;
   switch3 = Colors.white;
    switch4 = Colors.black;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
            body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Red',
                  style: TextStyle(color: switch1),
                ),
                Switch(
                  value: _switchColor,
                  // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                  onChanged: (value) {
                    _switchColor = value;
                    show();
                  },
                ),
                Text(
                  'Yellow',
                  style: TextStyle(color: switch2),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('off',style: TextStyle(
                  color: switch3
                ),),
                Switch(
                  value: switchOn,
                  // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                  onChanged: (value) {
                    switchOn = value;
                    check();
                  },
                ),
                Text('ON',style: TextStyle(
                  color: switch4
                ),)
              ],
            ),
            ElevatedButton(
              onPressed: () => goFunction(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }


  show() {
    _switchColor == true ? switch1 = Colors.white : switch1 = Colors.black;
   _switchColor == true ? switch2 = const Color.fromARGB(255, 121, 113, 113) : switch2 = Colors.white;
   
      
    setState(() {});
  }

  check() {
switchOn == true ? switch3 = Colors.white : switch3 = Colors.black;
   switchOn == true ? switch4 = Colors.black : switch4 = Colors.white;
 setState(() {});
  }


goFunction() async {

  if (switchOn == false) {
      imageD = 'images/lamp_off.png';
      switchOn = false;
  }else {
    if (switchOn == true) {
          imageD = 'images/lamp_on.png';
switchOn = true;
    }else {
        imageD = 'images/lamp_red.png';
        switchOn = false;
    }
  }

      imageD = await Get.to( Home(imageD: imageD));
        setState(() {});

}
}
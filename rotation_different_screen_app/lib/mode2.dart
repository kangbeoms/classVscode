import 'package:flutter/material.dart';

class Mode2 extends StatefulWidget {
  const Mode2({super.key});

  @override
  State<Mode2> createState() => _Mode2State();
}

class _Mode2State extends State<Mode2> {
  late bool switchValue;
  late Color bColor;

  @override
  void initState() {
    super.initState();
    switchValue = true;
    bColor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              if (bColor == Colors.blue) {
                bColor = Colors.red;
                switchValue = true;
              } else {
                bColor = Colors.blue;
                switchValue = false;
              }
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: bColor, foregroundColor: Colors.white),
            child: const Text('Flutter'),
          ),
          Switch(
            value: switchValue,
            // 이 value 는 스위치를 작동 했을 때 얻는 값이다
            onChanged: (value) {
              switchValue = value;
              if ( switchValue == true) {
                    bColor = Color.fromARGB(255, 255, 21, 0);
              }else {
                bColor = Colors.blue;
              }
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

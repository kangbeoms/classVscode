import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  late bool cartswitch;
  late bool clockswitch;
  late bool pencilswitch;

  late TextEditingController textEditingController;

  late String switchState;

  @override
  void initState() {
    super.initState();

    cartswitch = true;
    clockswitch = false;
    pencilswitch = false;
    textEditingController = TextEditingController();
    switchState = 'cart';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add view'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('구매'),
                Switch(
                  value: cartswitch,
                  // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                  onChanged: (value) {
                    cartswitch = value;
                    switchState = 'cart';
                    cartOn();
                  },
                ),
                Image.asset('images/cart.png')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('약속'),
                Switch(
                  value: clockswitch,
                  // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                  onChanged: (value) {
                    clockswitch = value;

                    if (clockswitch == false &&
                        pencilswitch == false &&
                        cartswitch == false) {
                      switchState = 'cart';
                      cartOn();
                    } else {
                      switchState = 'clock';
                      clockOn();
                    }
                  },
                ),
                Image.asset('images/clock.png')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('스터디'),
                Switch(
                  value: pencilswitch,
                  // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                  onChanged: (value) {
                    pencilswitch = value;
                    if (clockswitch == false &&
                        pencilswitch == false &&
                        cartswitch == false) {
                      switchState = 'cart';
                      cartOn();
                    } else {
                      switchState = 'pencil';
                      pencilOn();
                    }
                  },
                ),
                Image.asset('images/pencil.png')
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '글자를 입력하세요.',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (textEditingController.text.trim().isNotEmpty) {
                  addList();
                }
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text('OK'),
            )
          ],
        ),
      ),
    );
  }

  addList() {
    Message.image = switchState == 'cart'
        ? 'images/cart.png'
        : switchState == 'clcok'
            ? 'images/clcok.png'
            : 'images/pencil.png';
    Message.text = textEditingController.text;
    Message.what = true;
  }

  cartOn() {
    if (switchState == 'cart') {
      cartswitch = true;
      clockswitch = false;
      pencilswitch = false;
    }
    setState(() {});
  }

  clockOn() {
    cartswitch = false;
    pencilswitch = false;

    setState(() {});
  }

  pencilOn() {
    cartswitch = false;
    clockswitch = false;

    setState(() {});
  }
}

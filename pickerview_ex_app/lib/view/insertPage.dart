import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pickerview_ex_app/model/message.dart';

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

  late List imageView;
  late int whatItem;

  @override
  void initState() {
    super.initState();

    cartswitch = true;
    clockswitch = false;
    pencilswitch = false;
    textEditingController = TextEditingController();
    switchState = 'cart';
    imageView = [
      'cart.png',
      'clock.png',
      'pencil.png',
    ];
    whatItem = 0;
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
                Image.asset(
                  'images/${imageView[whatItem]}',

                  width: 50,
                  cacheHeight: 50,
                ),
                SizedBox(
                  width: 200, 
                  height: 200,
                  child: CupertinoPicker(
                      itemExtent: 30,
                      scrollController:
                          FixedExtentScrollController(initialItem: 0),
                      onSelectedItemChanged: (value) {
                        whatItem = value;
                        setState(() { });
                      },
                      children: List.generate(
                          imageView.length,
                          (index) => Center(
                                child: Image.asset(
                                  'images/${imageView[index]}',
                                  
                                  width: 40,
                                ),
                              ))),
                )
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
    Message.image = (whatItem == 0
        ? 'images/cart.png'
        : whatItem == 1
            ? 'images/clcok.png'
            : 'images/pencil.png');
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

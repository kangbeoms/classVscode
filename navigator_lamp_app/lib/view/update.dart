import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/savedData.dart';
import 'package:navigator_lamp_app/view/home.dart';

class Update extends StatefulWidget {
 
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {


  late TextEditingController textEditingController;
  
  late bool _switch;

  @override
  void initState() {
    super.initState();

    textEditingController = TextEditingController();
    textEditingController.text = SaveData.whatText;
    
    _switch = true;

    _switch = SaveData.switchValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: '글자를 입력하세요',
              ),
              keyboardType: TextInputType.text,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_switch == true ? 'on' : 'off'),
                Switch(
                  value: _switch,
                  // 이 value 는 스위치를 작동 했을 때 얻는 값이다
                  onChanged: (value) {
                    _switch = value;
                    setState(() {});
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                SaveData.whatText = textEditingController.text;
                if (_switch == true) {
                  SaveData.whatImage = 'images/lamp_on.png';
                  SaveData.switchValue = true; 
                } else {
                  SaveData.whatImage = 'images/lamp_off.png';
                   SaveData.switchValue = false; 
                }
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Home()));
                 SaveData.whatreturn = true;
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text('ON'),
            ),
          ],
        ),
      ),
    );
  }
}

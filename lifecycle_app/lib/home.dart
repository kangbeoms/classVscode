import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Field
  late String buttonState;
  
  @override
  void initState() {
    super.initState();
    buttonState = "OFF";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => onClick(),
             child: const Text('버튼을 눌러')
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('버튼 상태 :'),
                ),
                Text(buttonState),

              ],
             )
          ],
          ),
          
      ),
    );
  }
  // -- Functions --
  onClick() {
    setState(() {});
    if (buttonState == "OFF") {
      buttonState = "ON";
    }else{
      buttonState = "OFF";
    }   
  }
  
}
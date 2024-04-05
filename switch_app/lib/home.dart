import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Property 
  late bool  switchValue;
  late String appbarTitle;
  late String imageFile;

  @override
  void initState() {
    super.initState();
    
      appbarTitle == "Switch";
    switchValue == "피카츄";
    imageFile == 'images/ani2.webp';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title:  Text(appbarTitle),
            
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              imageFile
            ),
              Switch(
          value: switchValue,
          // 이 value 는 스위치를 작동 했을 때 얻는 값이다
          onChanged: (value) {
            switchValue = value;
              textName();
          },
          ),
          ],
          ),
      ),
    );
  }


  // -- Function --
  textName() {
  if(switchValue == true)  {
      appbarTitle == "피카츄";
      imageFile == 'images/ani2.webp';
  }else{
    appbarTitle == "스마일";
    imageFile == 'images/ani3.jpeg';
  }
  setState(() {});
  }
}
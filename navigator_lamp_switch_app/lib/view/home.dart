import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/savedata.dart';
import 'package:navigator_lamp_switch_app/view/controll.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late bool colorValue;
  late bool onOff;
  late String imageValue;


  @override
  void initState() {
    super.initState();

    colorValue = true;
    onOff = true;
    imageValue = 'images/lamp_on.png';
    imageValue = SavedData.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {
                SavedData.image = imageValue;
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Controll())).then((value) => nomore());
          },
            icon: const Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                SavedData.image,
                width: 200,
                height: 200,
            )
          ],
          ),
      ),
    );
  }

  nomore() {
    if ( SavedData.noMore == true) {

    }
  }
}
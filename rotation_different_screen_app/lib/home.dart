import 'package:flutter/material.dart';
import 'package:rotation_different_screen_app/mode.dart';
import 'package:rotation_different_screen_app/mode2.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Screen'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if(orientation == Orientation.portrait) {
            return const Mode1();
          } else {
            return const Mode2();
          }
        },
        ),
    );
  }
}
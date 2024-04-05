import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String buttonText;
  late Color buttonColor;
  
  @override
  void initState() {
    super.initState();
    buttonText == "Hello";
    buttonColor == Colors.blue;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change button color & text'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
          ),
          onPressed: () => buttonAction( buttonColor, buttonText ),
          child: Text(buttonText),
          ),
      ),
    );
  }

buttonAction(Color buttonColor, String buttonText) {
    buttonText == "Hello" ? (buttonText == "Flutter", buttonColor == Colors.yellow) 
    : (buttonText == "Hello", buttonColor == Colors.blue);
    setState(() {});
}
      
}
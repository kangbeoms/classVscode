import 'package:flutter/material.dart';

class Mode1 extends StatefulWidget {
  const Mode1({super.key});

  @override
  State<Mode1> createState() => _ModeState();
}

class _ModeState extends State<Mode1> {
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
      child: Stack(
        
        children: [
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                if ( bColor == Colors.blue ) {
                    bColor = Colors.red;
                    
                }else {
                        bColor = Colors.blue;
                }
                setState(() {});
                },
                style: ElevatedButton.styleFrom(
                      backgroundColor: bColor,
                      foregroundColor: Colors.white
                ),
                child: const Text('Flutter'),
              ),
            ],
          ),
         
        ],
      ),
    );
  }
}

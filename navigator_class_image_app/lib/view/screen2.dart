import 'package:flutter/material.dart';

class screen2 extends StatelessWidget {
  const screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Screen 2nd',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('Screen 2nd',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                                        onPressed: () => Navigator.pushNamed(context,'/2ndI'),
                                         child: Text('Second image page'),
                                         ),
                        )  
              ],
              ),
          ),
    );
  }
}
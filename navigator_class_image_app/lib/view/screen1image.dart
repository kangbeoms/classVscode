import 'package:flutter/material.dart';

class screen1image extends StatelessWidget {
  const screen1image({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First image page',
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
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      'images/ani1.jpg'
                  ),
                  radius: 80,
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text('Go to home page') 
                            ),
                ),
          ],
          ),
      ),
    );
  }
}
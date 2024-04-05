import 'package:flutter/material.dart';

class third_page extends StatelessWidget {
  const third_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
              title: Text('3번째 페이지'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go to Second page') 
          ),
            ],
            ),
        )
    );
  }
}
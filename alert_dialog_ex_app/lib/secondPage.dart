import 'package:flutter/material.dart';

class secondPage extends StatelessWidget {
  const secondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
          },
            icon: const Icon(Icons.arrow_back)
            ),
            centerTitle: false,
            title: const Text('Second Page'),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          body: Center(
            child: const Text('2번째 페이지 입니다.'),
          ),
    );
  }
}
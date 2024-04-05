import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final List<String> user;
  const SecondPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.wb_sunny)
            ),
            title: Text('님 환영합니다.'),
      ),
      backgroundColor: Colors.black,
      body: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage(
            'images/coin.jpeg',
          ),
          radius: 70,
        ),
      ),
    );
  }
}

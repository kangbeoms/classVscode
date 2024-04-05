import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "현재 클릭수는 $count 입니다.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                count++;
                setState(() {});
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: Column(
                children: [
                  Text('증가'),
                  Icon(Icons.add),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          setState(() {});
        },
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Column(
          children: [
            Text('증가'),
            Icon(Icons.add),
          ],
        ),
      ),
    );
  }
}

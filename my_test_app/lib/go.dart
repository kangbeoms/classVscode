import 'package:flutter/material.dart';

class Go extends StatefulWidget {
  final String data;
  const Go({super.key, required this.data});

  @override
  State<Go> createState() => _GoState();
}

class _GoState extends State<Go> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dddddd'),
      ),
      body: Text(widget.data),
    );
  }
}
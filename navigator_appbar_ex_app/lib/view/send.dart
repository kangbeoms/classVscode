import 'package:flutter/material.dart';

class send extends StatelessWidget {
  const send({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text('Send Mail'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text('유비에게 보낸 메일'),
            Text('장비에게 보낸 메일'),
            Text('조조에게 보낸 메일'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alert Dialog with Gesture'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _showDialog(context),
                child: const Text('Hello')
            )
            ],
          ),
        )
        );
  }
 // Functions --------------
 _showDialog(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (BuildContext ctx) {
          return AlertDialog(
            backgroundColor: Colors.amber,
            title: const Text('Alert Title'),
            content: const Text('Hello 를 \n Touch 했다'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('종료'),
                  ),
              )
            ],
          );
      },
      );
}

}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('alert and Push'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          
          child: GestureDetector(
              onTap: () => _showDialog(context),
            child: const Text('Move the 2nd Page'),
            ) 
          ),
    );
  }


  // Function --------

  _showDialog(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (BuildContext ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
                ),
            backgroundColor: Colors.white,
            title: const Text('페이지 이동'),
            content: const Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/2nd');
                  },
                  child: const Text('Page 이동'),
                  ),
              )
            ],
          );
      },
      );
}
}
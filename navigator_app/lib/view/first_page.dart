import 'package:flutter/material.dart';
import 'package:navigator_app/view/second_page.dart';

class first_page extends StatelessWidget {
  const first_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('First page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed:  ()  {
            Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const Second_page();
              }));
          },
          child: const Text(' go to Second page')
          )
        ),
    );
  }
}
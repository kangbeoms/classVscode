import 'package:flutter/material.dart';
import 'package:navigator_app/view/third_page.dart';


class Second_page extends StatelessWidget {
  const Second_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go to first page') 
          ),
          ElevatedButton(
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const third_page();
              }));
            },
          child: const Text('go to 3page'))
          ],
          )
        
          
        ),
    );
  }
}
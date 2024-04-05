import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen',
        style: TextStyle(
            fontWeight: FontWeight.bold
        ),
        ),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/1st'),
               child: Text('go to the 1st page'),
               ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/2nd'),
                child: const Text('go to the 2nd page'),
                
              ),
          ],
          ),
      ),
    );
  }
}
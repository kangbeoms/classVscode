import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('AppBar Icon',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                  ),
                  //Text('a-------'),
            
          ],
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              
          },
            icon: const Icon(Icons.menu)
            ),
            actions: [
            IconButton(
              onPressed: () {
                
              }, 
              icon: const Icon(Icons.email),
              ),
              IconButton(
                onPressed: () {
                  
                },
                icon: const Icon(Icons.add_alarm),
                ),
              IconButton(
                onPressed: () {
                  
                },
                icon:const Icon(Icons.add_outlined),
                ),
                GestureDetector(
                  onTap: () {
                    print('image is tapped');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/ani2.webp',
                      width: 30,
                    ),
                  ),
                )
            ],
      ),
    );
  }
}
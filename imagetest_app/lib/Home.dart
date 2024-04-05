import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Padding'),
            backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        
        child: Center(
        
          child: Column(
            // 세로 가로 정렬
            crossAxisAlignment: CrossAxisAlignment.start,

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Image.asset(
                    'images/ani1.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                  ),
                ),  
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                      'images/ani2.webp',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),  
                    Padding(
                    padding: const EdgeInsets.all(30),
                      
                    child: Image.asset(
                      'images/ani2_2.jpeg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                      
                    ),
                  ),  
                    ],
                  ),
                ),
              
              Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Image.asset(
                      'images/ani4.jpeg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),  
                SingleChildScrollView(
                  
                  scrollDirection: Axis.horizontal,
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Padding(
                    padding: const EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Image.asset(
                        'images/ani3.jpeg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),  
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                      'images/ani3_2.webp',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ),  
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image.asset(
                      'images/ani3_3.webp',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  )  
                    ],
                    ),
                )
              
            
          ],
          ),
          ),
      ),
    );
  }
}
import 'package:collection_ciew_image_app/view/datail.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> flowerList;
  late int count;

  @override
  void initState() {
    super.initState();
    flowerList = [
      'images/flower_01.png',
      'images/flower_02.png',
      'images/flower_03.png',
      'images/flower_04.png',
      'images/flower_05.png',
      'images/flower_06.png',
    ];
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('꽃 정원'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        itemCount: flowerList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(const Detail(), arguments: flowerList[index]);
            },
            child: Column(
              children: [
                Card(                 
                    shadowColor: Colors.blueGrey[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    ),
                    elevation: 15,
                  color: Colors.blueGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                
                        children: [
                
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                              flowerList[index],
                              width: 150,
                              height: 150,
                              fit: BoxFit.fill,
                        ),
                            ),
                          ),
                            Positioned(
                              left: 20,
                              top: 70,
                              child: RotationTransition(
                                turns: const AlwaysStoppedAnimation(360/195),
                                child: Opacity(
                                  opacity: 0.6,
                                  child: Text('my Product',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 23,
                                    color: Colors.red[500],
                                    
                                    
                                  ),
                                  ),
                                ),
                                  //alignment: Alignment( 1.0, 0.0),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(flowerList[index],
                        
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          
                          
                        ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

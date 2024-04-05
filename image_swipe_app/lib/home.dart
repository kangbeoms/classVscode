import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Property
  // Image 배열
  late List imageName;
  // Image 배열 현재 번호
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];

    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image swiping'),
      ),
      body: SimpleGestureDetector(
        onVerticalSwipe: (direction) => _onVerticalSwipe(direction),
        onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),
        onDoubleTap: () => _onDoubleTap(),
        child: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage]
              ),
              Image.asset(
                'images/${imageName[currentImage]}',
                width: 300,
              ),
              
              

            ],
            ),
        ),
      ),
    );
  } 

  // Function -------

  _onHorizontalSwipe(direction) {
    if(direction == SwipeDirection.left) {
        currentImage +=1;
        if(currentImage >= imageName.length) {
          currentImage = 0;
        }
    }else{
      currentImage -=1;
      if(currentImage < 0 ) {
        currentImage = imageName.length -1;
      }
    }
    setState(() {});
  }

_onVerticalSwipe(direction) {
  if(direction == SwipeDirection.up) {
        currentImage +=1;
        if(currentImage >= imageName.length) {
          currentImage = 0;
        }
    }else{
      currentImage -=1;
      if(currentImage < 0 ) {
        currentImage = imageName.length -1;
      }
    }
    setState(() {});
}
_onDoubleTap() {
        currentImage +=1;
        if(currentImage >= imageName.length) {
          currentImage = 0;
    }
    setState(() {});

}

}
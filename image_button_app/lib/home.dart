import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
        title: const Text('무한 이미지 반복'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
              const SizedBox(
                height: 40,
              ),
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  imageName[currentImage]
                ),
            ),
              Image.asset(
                'images/${imageName[currentImage]}',
                width: 400,
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(

              children: [
                const SizedBox(
                  width: 100,
                ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                                      onPressed: () => _ahead(),
                                      style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                      ), 
                                      child: const Text('다음'),
                                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                  onPressed: () => _back(),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                  ), 
                  child: const Text('이전'),
                  ),
                ),
            
              ],
            ),
          )
      
        ],
        ),
      ),
    );
  }



  // Function ------

  _onVerticalSwipe(direction) {

  }
  
_ahead()  {
        currentImage +=1;
        if(currentImage >= imageName.length) {
          currentImage = 0;
        }
setState(() {});
}

_back() {
        currentImage -=1;
      if(currentImage < 0 ) {
        currentImage = imageName.length -1;
      }
      setState(() {});
}

}
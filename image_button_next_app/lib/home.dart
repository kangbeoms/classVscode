import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List _imagesFile;
  late int _currentPage;
  late int _nextPage;

  @override
  void initState() {
    super.initState();
    _imagesFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    _currentPage = 0;
    _nextPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('무한 이미지 반복'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _imagesFile[_currentPage],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue, width: 5)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'images/${_imagesFile[_currentPage]}',
                      fit: BoxFit.fill,
                      width: 350,
                      height: 500,
                    ),
                  ),
                ),
                Positioned(
                  left: 250,
                  top: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.amber,
                        width: 5,
                      )
                    ),
                    child: Image.asset(
                      'images/${_imagesFile[_nextPage]}',
                      fit: BoxFit.fill,
                      width: 100,
                      height: 150,
                    ),
                  ) 
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                      goBack();
                  },
                 child: const Text('뒤')
                 ),
                  ElevatedButton(
                  onPressed: () {
                      goForward();
                  },
                 child: const Text('앞')
                 ),
              ],
            )
          ],
          
        ),
      ),
    );
  }
goBack() {

      
        _nextPage  -=1;
    if ( _currentPage  <=  _imagesFile.length) {
          _currentPage = _imagesFile.length -1;
          _nextPage = 5;
    } else {
            _currentPage = 0;
            
            
    }
     setState(() {});
}

goForward() {
     _currentPage+=1;
        _nextPage +=1;
  if ( _currentPage == _imagesFile.length -1) {
          _nextPage = 0;
  } else if 
         (_currentPage >= _imagesFile.length) {
          _currentPage = 0;
        }
  setState((){});
}


}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List _imageName;
  late int _selectedItem;

  @override
  void initState() {
    super.initState();

    _imageName = [
      'w1.jpg',
      'w2.jpg',
      'w3.jpg',
      'w4.jpg',
      'w5.jpg',
      'w6.jpg',
      'w7.jpg',
      'w8.jpg',
      'w9.jpg',
      'w10.jpg',
    ];
    _selectedItem = 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('picker view'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Picker View로 이미지 선택',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 300,
              height: 200,
              child: CupertinoPicker(
                  itemExtent: 50,
                  scrollController: FixedExtentScrollController(initialItem: 4),
                  onSelectedItemChanged: (value) {
                    _selectedItem = value;
                    setState(() {});
                  },
                  children: List.generate(
                      _imageName.length,
                      (index) => Center(
                            child: Image.asset(
                              'images/${_imageName[index]}',
                              width: 50,
                            ),
                          ))),
            ),
            Text('Selected Item : ${_imageName[_selectedItem]}'),
            SizedBox(
              width: 300,
              height: 200,
              child: Image.asset(
                'images/${_imageName[_selectedItem]}',
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}

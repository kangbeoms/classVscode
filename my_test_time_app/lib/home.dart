import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> image;
  late int count;
  late FixedExtentScrollController scrollController;
  late Timer timer;
  late bool scrollingDown;

  @override
  void initState() {
    super.initState();

    image = [
      'bee.png',
      'cat.png',
      'cow.png',
      'dog.png',
      'fox.png',
      'pig.png',
      'wolf.png',
    ];
    count = 0;
    scrollController = FixedExtentScrollController(initialItem: 0);
    scrollingDown = true;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (scrollingDown) {
        if (scrollController.selectedItem < image.length - 1) {
          scrollController.jumpToItem(scrollController.selectedItem + 1);
        } else {
          scrollingDown = false;
        }
      } else {
        if (scrollController.selectedItem > 0) {
          scrollController.jumpToItem(scrollController.selectedItem - 1);
        } else {
          scrollingDown = true;
        }
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sdsda'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 200,
              child: CupertinoPicker(
                itemExtent: 50,
                scrollController: scrollController,
                onSelectedItemChanged: (value) {
                  count = value;
                  setState(() {});
                },
                children: List.generate(
                    image.length,
                    (index) => Center(
                          child: Image.asset(
                            'images/${image[index]}',
                            width: 50,
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

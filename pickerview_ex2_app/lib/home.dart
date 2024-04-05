import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List dan;
  late int whatNum;
  late FixedExtentScrollController fixedExtentScrollController;

  @override
  void initState() {
    super.initState();
    dan = [];
    whatNum = 2;
    fixedExtentScrollController = FixedExtentScrollController();
    addDan();
  }

  addDan() {
    for (int i = 2; i <= 9; i++) {
      dan.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${whatNum + 2} 단'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: CupertinoPicker(
                  itemExtent: 30,
                  scrollController: FixedExtentScrollController(initialItem: -2),
                  onSelectedItemChanged: (value) {
                    whatNum = value;
                    //print(whatNum);
                    setState(() {});
                  },
                  children: List.generate(
                      dan.length,
                      (index) => Center(
                            child: Text('${dan[index]}단'),
                          ))),
            ),
            for (int i = 1; i <= 9; i++)
              Container(
                width: 200,
                color: Colors.purple[100],
                child: Text(
                  '${whatNum + 2} x $i = ${(whatNum + 2) * i}',
                ),
              ),
              Container(
                width: 200,
                color: Colors.purple[100],
                child: const Text('')),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_insert_app/model/animal_list.dart';

class FirstPage extends StatefulWidget {
  final List<Animal> list;
  const FirstPage({super.key, required this.list});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => show(index),
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[index].imagePath,
                      width: 100,
                    ),
                    Text('                    ${widget.list[index].animalName}')
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  show(index) {
      Get.defaultDialog(
        title: widget.list[index].animalName,
        middleText: '이 동물은 ${widget.list[index].kind} 입니다. \n'
          '${widget.list[index].flyExist ? '날수 있습니다.' : '날 수 없습니다.'}',
        backgroundColor: Colors.yellowAccent, 
        barrierDismissible: false,
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('종료')),
        ]);
  }
}

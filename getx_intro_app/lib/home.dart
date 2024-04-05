import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Navigation'),
            ElevatedButton(
              onPressed: () => Get.to(const SecondPage()),
              child: const Text('Get.to()'),
            ),
            ElevatedButton(
                onPressed: () => Get.toNamed('/third'),
                child: const Text('Get.toNamed()')),
            const Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            const Text('Snack Bar'),
            ElevatedButton(
                onPressed: () => buttonSnack(),
                child: const Text('Snack Bar 보이기')),
            const Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            const Text('Dialog'),
            ElevatedButton(
              onPressed: () => buttonDialog(),
              child: const Text('Dialog 보이기'),
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            const Text('Screen Transition'),
            ElevatedButton(
                onPressed: () {
                  Get.to(const SecondPage(),
                      transition: Transition.fade,
                      duration: const Duration(seconds: 3));
                },
                child: const Text('Get.to() : Transition')),
            ElevatedButton(
                onPressed: () => Get.toNamed('third2'),
                child: const Text('Get.toNamed() : Transition')),
            const Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            const Text('Navigation & Arguments'),
            ElevatedButton(
                onPressed: () => Get.to(const SecondPage(), arguments: "First"),
                child: const Text('Get.to( : Single Arguments)')),
            ElevatedButton(
                onPressed: () =>
                    Get.to(const SecondPage(), arguments: ["First", "Second"]),
                child: const Text('Get.to() : Multiple Arguments')),
            ElevatedButton(
                onPressed: () async {
                  var returnValue = await Get.to(const SecondPage());
                  Get.snackbar("Return Value", returnValue);
                },
                child: const Text('Get.to() : Return Arguments')),
          ],
        ),
      ),
    );
  }

// -- function --

  buttonSnack() {
    Get.snackbar('Snack bar', 'Message',
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.blue,
        snackPosition: SnackPosition.BOTTOM);
  }

  buttonDialog() {
    Get.defaultDialog(
        title: 'Dialog',
        middleText: 'Message',
        backgroundColor: Colors.yellowAccent,
        barrierDismissible: false,
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Exit')),
        ]);
  }
}

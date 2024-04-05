import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String image;
  late bool imageState;

  @override
  void initState() {
    super.initState();
    image = 'images/lamp_on.png';
    imageState = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert를 이용한 메세지 출력'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              image,
              height: 650,
              width: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onlight();
                    },
                    child: const Text('켜기'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      offlight();
                    },
                    child: const Text('끄기'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  onlight() {
    if (imageState == false) {
      goSheet();
    } else {
      goDia();
    }
  }

  offlight() {
    if (imageState == false) {
      goDia();
    } else {
      goSheet();
    }
  }

  goSheet() {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoActionSheet(
        title: Text('램프 ${imageState ? '끄기' : '켜기'}'),
        message: Text('램프를 ${imageState ? "끄시겠습니까" : "켜시겠습니까"}'),
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {
                imageState == false
                    ? image = 'images/lamp_on.png'
                    : image = 'images/lamp_off.png';
                image == 'images/lamp_on.png'
                    ? imageState = true
                    : imageState = false;
                setState(() {});
                Get.back();
              },
              child: const Text('예')),
          CupertinoActionSheetAction(
              onPressed: () {
                Get.back();
              },
              child: const Text('아니오'))
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  goDia() {
    Get.defaultDialog(
        title: '경고',
        middleText: '현재 램프가 ${imageState ? '켜진상태입니다.' : '꺼진상태입니다.'}',
        barrierDismissible: true,
        actions: [
          TextButton(
              onPressed: () => Get.back(), child: const Text('네 알갰습니다.')),
        ]);
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  late TextEditingController codeEditingController;
  late TextEditingController nameEditingController;
  late TextEditingController deptEditingController;
  late TextEditingController phoneEditingController;

  late String code;
  late String name;
  late String dept;
  late String phone;

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  File? imgFile;
  @override
  void initState() {
    super.initState();
    codeEditingController = TextEditingController();
    nameEditingController = TextEditingController();
    deptEditingController = TextEditingController();
    phoneEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert for Firebase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller: codeEditingController,
                decoration: const InputDecoration(labelText: '학번을 입력하세요'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller: nameEditingController,
                decoration: const InputDecoration(labelText: '이름을 입력하세요'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller: deptEditingController,
                decoration: const InputDecoration(labelText: '전공을 입력하세요'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller: phoneEditingController,
                decoration: const InputDecoration(labelText: '전화번호를 입력하세요'),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
                onPressed: () => getImageFromGallery(ImageSource.gallery),
                child: const Text('Gallery')),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.grey,
              child: Center(
                child: imageFile == null
                    ? const Text('Image not selected')
                    : Image.file(File(imageFile!.path)),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  insertAction();
                },
                child: const Text('입력'))
          ],
        ),
      ),
    );
  }

  getImageFromGallery(imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    imageFile = XFile(pickedFile!.path);
    imgFile = File(imageFile!.path);
    setState(() {});
  }

  insertAction() async {
    String code = codeEditingController.text;
    String name = nameEditingController.text;
    String dept = deptEditingController.text;
    String phone = phoneEditingController.text;
    // 이미지는 firebase 에 경로가 저장 되고 나서 가져올수 있다.
    String image = await preparingImage();

    FirebaseFirestore.instance.collection('students').add({
      'code': code,
      'name': name,
      'dept': dept,
      'phone': phone,
      'image': image
    });

    Get.back();
  }

  Future<String> preparingImage() async {
    final firebaseStorage = FirebaseStorage.instance
        .ref()
        .child('images')
        .child('${codeEditingController.text}.png');
    // 파일 업로드
    await firebaseStorage.putFile(imgFile!);
    //  경로를 가져온다.
    String downloadURL = await firebaseStorage.getDownloadURL();
    return downloadURL;
  }
}

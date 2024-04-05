
import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var value = Get.arguments ?? "__";
  late TextEditingController codeEditingController;
  late TextEditingController nameEditingController;
  late TextEditingController deptEditingController;
  late TextEditingController phoneEditingController;
  

  

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

    codeEditingController.text = value[1];
    nameEditingController.text = value[2];
    deptEditingController.text = value[3];
    phoneEditingController.text = value[4];
    

  

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update for Firebase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller: codeEditingController,
                decoration: const InputDecoration(labelText: '수정 불가'),
                keyboardType: TextInputType.text,
                readOnly: true,
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
                    ? Image.network(value[5])
                    : Image.file(File(imageFile!.path)),
              ),
            ),
       
            ElevatedButton(
                onPressed: () {
                    updataAction();
                },
                child: const Text('수정')
                )
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

  updataAction() async {
      await deleteImage();

    String image = "";
    image = imageFile == null ? value[5] :  await preparingImage();
FirebaseFirestore.instance.collection('students')
                  .doc(value[0]).
                  update({
                    'code': codeEditingController.text,
                    'name': nameEditingController.text,
                    'dept': deptEditingController.text,
                    'phone': phoneEditingController.text,
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

  deleteImage() async{
     final firebaseStorgae = FirebaseStorage.instance.ref().child('images').child('${value[1]}.png');
    //삭제
    await firebaseStorgae.delete();
  }
}

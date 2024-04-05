import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_sql_app/model/students.dart';
import 'package:text_sql_app/view/database_handler.dart';

class UpdateStudents extends StatefulWidget {
  const UpdateStudents({super.key});

  @override
  State<UpdateStudents> createState() => _UpdateStudentsState();
}

class _UpdateStudentsState extends State<UpdateStudents> {
  late DatabaseHandler handler;
  late String code;
  late String name;
  late String dept;
  late String phone;
  late String defultImage;
  late int what;

  XFile? _file;
  final ImagePicker picker = ImagePicker();

  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  var value = Get.arguments ?? '____';
  @override
  void initState() {

    super.initState();
    handler = DatabaseHandler();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
    defultImage = "";
    what =0;
    codeController.text = value[0];
    nameController.text = value[1];
    deptController.text = value[2];
    phoneController.text = value[3];
  

    code = '';
    name = '';
    dept = '';
    phone = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert for SQLite'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: '학번을 입력하세요'),
                keyboardType: TextInputType.text,
                readOnly: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: '성명을 입력하세요'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: deptController,
                decoration: const InputDecoration(labelText: '전공을 입력하세요'),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: '전화번호를 입력하세요'),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              child: const Text('갤러리'),    
            ),
            Container(
              width: MediaQuery.of(context).size.height,
              height: 100,
              color: Colors.black26,
              child: Center(
                child:
                
                    _file == null
                    ?  Image.memory(value[4])
                    : Image.file(File(_file!.path)),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                goUpdate();
              },
              child: const Text('수정'),
            ),
            ElevatedButton(
              onPressed: () async {
                // code = codeController.text;
                // name = nameController.text;
                // dept = deptController.text;
                // phone = phoneController.text;

                // File imageFile = File(_file!.path);
                // Uint8List getImage = await imageFile.readAsBytes();

                // Students students = Students(
                //     code: code,
                //     name: name,
                //     dept: dept,
                //     phone: phone,
                //     image: getImage);
                // await handler.deleteStudents();
                // // print(returnValue);
                // _deleteDialog();
              },
              child: const Text('삭제'),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog() {
    Get.defaultDialog(
        title: '수정결과',
        middleText: '수정이 완료되었습니다.',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: const Text('OK'),
          ),
        ]);
  }

  _deleteDialog() {
    Get.defaultDialog(
        title: '삭제결과',
        middleText: '삭제가 완료되었습니다.',
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        barrierDismissible: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: const Text('OK'),
          ),
        ]);
  }

  getImage(imageSource) async {
    final XFile? pickerFile = await picker.pickImage(source: imageSource);
    if (pickerFile == null) {
      return;
    } else {
      _file = XFile(pickerFile.path);
      setState(() {});
    }
  }

  goUpdate() async {

    
    
Uint8List iMage;
if ( _file == null) {
  iMage = value[4];
}else {
    File imageFile = File(_file!.path);
    Uint8List getImage = await imageFile.readAsBytes();
    iMage = getImage;
}

    //getImage = getImage == null ? value[4] :  imageFile.readAsBytes();
    code = codeController.text;
    name = nameController.text;
    dept = deptController.text;
    phone = phoneController.text;

    var students = Students(
        code: code, name: name, dept: dept, phone: phone, image: iMage);
    await handler.updateStudents(students);
    _showDialog();
  }



}

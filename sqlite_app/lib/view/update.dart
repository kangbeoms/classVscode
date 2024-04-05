import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_app/model/students.dart';
import 'package:sqlite_app/viewmodel/database_handler.dart';

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

  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  var value = Get.arguments ?? "__";
  
  @override
  void initState() {
    
    super.initState();
    handler = DatabaseHandler();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
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
        title: const Text('Update for SQLite'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  labelText: '학번을 입력하세요'
                ),
                keyboardType: TextInputType.text,
                readOnly: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '성명을 입력하세요'
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: deptController,
                decoration: const InputDecoration(
                  labelText: '전공을 입력하세요'
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: '전화번호를 입력하세요'
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
              onPressed: () async{
                  code = codeController.text;
                  name = nameController.text;
                  dept = deptController.text;
                  phone = phoneController.text.toString();

                  Students students = Students(code: code, name: name, dept: dept, phone: phone);
                  await handler.updateStudents(students);
              
                    _showDialog();
                  
              },
                child: const Text('수정')
                ),
               // ElevatedButton(onPressed: onPressed, child: child)
          ],
        ),
      ),
    );
  }
  _showDialog() {
    Get.defaultDialog(
      title: '입력 결과',
      middleText: '입력이 완료 되었습니다.',
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
  barrierDismissible: false,
  actions: [
    TextButton(
      onPressed: () {
        Get.back();
        Get.back();
      },
        child: const Text('예'))
  ]
    );
  }
}
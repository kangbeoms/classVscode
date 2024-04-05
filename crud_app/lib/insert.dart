import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {

  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;
  late List data;
  late String code;
  late String name;
  late String dept;
  late String phone;


@override
  void initState() {
    super.initState();
    data = [];
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();
   

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('insert for CRUD'),
            
          ),
          body: Center(
            child: Column(
              
              children: [
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: '코드를 입력하세요',
                    
                  ),
        
                    
                ),
                TextField(
                  controller: nameController,
                    decoration: const InputDecoration(
                    labelText: '이름을  입력하세요',
                    
                  ),
                ),
                TextField(
                  controller: deptController,
                    decoration: const InputDecoration(
                    labelText: '전공을  입력하세요',
                    
                  ),
                ),
                TextField(
                  controller: phoneController,
                    decoration: const InputDecoration(
                    labelText: '전화번호를  입력하세요',
                    
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                  getJSONData();
                  
                  },
                  child: const Text('입력'))

              ],
            ),
          ),
    );
  }

    getJSONData() async {
    code = codeController.text;
    name = nameController.text;
    dept = deptController.text;
    phone = phoneController.text;
    var url = Uri.parse(
        'http://localhost:8080/Flutter/JSP/insertinto.jsp?scode=$code&sname=$name&sdept=$dept&sphone=$phone');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes)); 
    var result = dataConvertedJSON['result'];
    setState(() {});
    if ( result == 'No') {
      showNo();
    }else{
        showOk();
    }
  }

  showOk() {
        Get.defaultDialog(
        title: '성공',
        middleText: '입력에 성공했습니다.',
        backgroundColor: Colors.yellowAccent,
        barrierDismissible: false,
        actions: [
          TextButton(onPressed: () {
                Get.back();
                Get.back();
                setState(() {});
          },
          child: const Text('Exit'),
          )
        ]
        );
  }

  showNo() {
    Get.snackbar('에러', '입력에 실패했습니다.',
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.blue,
        snackPosition: SnackPosition.TOP);
  }
}
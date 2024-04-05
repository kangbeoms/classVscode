import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  
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
        title: const Text('Update'),
      ),
         body: Center(
            child: Column(
              
              children: [
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: '수정 불가',
                    
                    
                  ),
                  readOnly: true,
        
                    
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
                  child: const Text('수정'))

              ],
            ),
          ),
    );
  }
}
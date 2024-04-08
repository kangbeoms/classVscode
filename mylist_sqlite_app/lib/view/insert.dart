import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/model/rest_list.dart';
import 'package:test_app/view_model.dart/database_handler.dart';

class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  late DatabaseHandler handler;
  late String name;
  late String lat;
  late String lng;
  late String phone;
  late String estimate;

  late TextEditingController nameController;
  late TextEditingController latController;
  late TextEditingController lngController;
  late TextEditingController estimateController;
  late TextEditingController phoneController;

  late DateTime date;
  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    handler = DatabaseHandler();
    nameController = TextEditingController();
    latController = TextEditingController();
    lngController = TextEditingController();
    estimateController = TextEditingController();
    phoneController = TextEditingController();

    name = '';
    lat = '';
    lng = '';
    estimate = "";
    phone = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('맛집 추가'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[300],
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text('갤러리'),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      color: Colors.grey[300],
                      child: Center(
                        child: imageFile == null
                            ? const Text(
                                'image is not selected',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 0, 0, 0.4),
                                ),
                              )
                            : Image.file(File(imageFile!.path)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: TextField(
                              controller: latController,
                              decoration: const InputDecoration(
                                labelText: '위도',
                                icon: Icon(Icons.edit_location_alt_outlined),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: TextField(
                              controller: lngController,
                              decoration: const InputDecoration(
                                  labelText: '경도',
                                  icon: Icon(Icons.edit_location_alt_sharp)),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            labelText: '이름', border: OutlineInputBorder()),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                            labelText: '전화', border: OutlineInputBorder()),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: TextField(
                        controller: estimateController,
                        decoration: const InputDecoration(
                            labelText: '평가', border: OutlineInputBorder()),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      insertAction();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[300],
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text('입력'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  getImage(imageSource) async {
    final XFile? pickerFile = await picker.pickImage(source: imageSource);
    if (pickerFile == null) {
      return;
    } else {
      imageFile = XFile(pickerFile.path);
    }
      setState(() {});
  }

  insertAction() async {
    lat = latController.text.toString();
    name = nameController.text.toString();
    lng = lngController.text.toString();
    phone = phoneController.text.toString();
    estimate = estimateController.text.toString();
    
    

    // File 타입을 byte 타입으로 만들기
    File imageFile1 = File(imageFile!.path);
    Uint8List getImage = await imageFile1.readAsBytes();
          print('이미지 경로 $getImage');          

    var restList = RestList(name: name, phone: phone, lat: lat,
                            lng: lng, image: getImage.toString(), estimate: estimate,
                              initdate: date.toString()); 
    await handler.insertList(restList);
    
    _showDialog();

  }

   _showDialog() {
    Get.defaultDialog(
        title: '입력완료',
        middleText: '입력이 완료되었습니다.',
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
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

XFile? imageFile;

final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery & Camera'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => getImage(ImageSource.gallery),
                    child: const Text('Gallery')
                    ),
                      ElevatedButton(
                    onPressed: () => getImage(ImageSource.camera),
                    child: const Text('Camera')
                    ),
              
                ],
              ),
            ),
            SizedBox(
              // 각각의 핸드폰의 크기를 가져온다. 
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: imageFile ==null 
            ? const Text('Image is not placed')
            : Image.file(File(imageFile!.path)),
              ),
            )
          ],
        ),
      ),
    );
  }

//Function ---
getImage(imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile == null) {
      imageFile = null;
    }else {
      imageFile = XFile(pickedFile.path);
    }
    setState(() {});
}

}
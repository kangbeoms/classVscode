import 'package:collection_view_label_app/model/savedate.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

late TextEditingController textEditingController;

@override
  void initState() {
    super.initState();
    
    textEditingController = TextEditingController();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('추가'),
            backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        labelText: '글자를 입력하시오.',
                        
                        
                      ),
                      keyboardType: TextInputType.text,
                ),
                
              ),
              ElevatedButton(
                onPressed: () =>  insertData(),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
                ),
                child: const Text('추가'),
                ),
              
            ],
          )
        ),
      ),
    );
  }

  insertData() {
       SaveData.text = textEditingController.text.trim();
          SaveData.nono = true;
       setState(() {});
       Navigator.of(context).pop();
  }
}
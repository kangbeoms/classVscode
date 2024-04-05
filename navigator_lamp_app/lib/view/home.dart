import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/savedData.dart';
import 'package:navigator_lamp_app/view/update.dart';

class Home extends StatefulWidget {
  
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late TextEditingController textEditingController;
  late bool lightState;
  late String image;


@override
  void initState() {
    super.initState();

    textEditingController = TextEditingController();
    textEditingController.text = SaveData.whatText;
    
    lightState = true;
    image = 'images/lamp_on.png';

    image = SaveData.whatImage;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.home),

        actions: [
              IconButton(
                onPressed: () {
                  SaveData.whatText =  textEditingController.text;
                  SaveData.whatImage = image;
                  
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Update())).then((value) => about());
                },
              icon: const Icon(Icons.edit),
              )
        ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      labelText: '글자를 입력하세요.'
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset(
                      image,
                      width: 200 ,
                      height: 200,
                  ),
                )
              ],
              ),
          ),
        ),
    );
  }

about() {
  if (SaveData.whatreturn == true) {
        textEditingController.text = SaveData.whatText;
        image = SaveData.whatImage;
        SaveData.whatreturn = true;
        setState(() {});
  }
}

}
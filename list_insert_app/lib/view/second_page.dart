import 'package:flutter/material.dart';
import 'package:list_insert_app/model/animal_list.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({super.key, required this.list});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property

  late TextEditingController nameController; // TextField
  late int _radioValue; // radioButton
  late bool flyExist; // checkBox
  late String _imagePath; // image 선택
  late String iamgeName;
  late List<Color> animalColor;
  late String getAnimalName;
  late String Aname;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _radioValue = 0;
    flyExist = false;
    _imagePath = '';
    iamgeName = '';
    getAnimalName = '';
    Aname = '';
    animalColor = [
          Colors.yellow,
          Colors.yellow,
          Colors.yellow,
          Colors.yellow,
          Colors.yellow,
          Colors.yellow,
          Colors.yellow,
          Colors.yellow,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: getAnimalName
                
              ),
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (value) => _radioChange(value),
                ),
                const Text('양서류'),
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (value) => _radioChange(value),
                ),
                const Text('파충류'),
                Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (value) => _radioChange(value),
                ),
                const Text('포유류'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('날 수 있나요?'),
                Checkbox(
                  value: flyExist,
                  onChanged: (value) {
                    flyExist = value!;
                    setState(() {});
                  },
                ),
              ],
            ),

              SizedBox(
                width: 500,
                height: 100,
                child: ListView.builder(
                  itemCount: animalColor.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                              width: 100,
                              height: 100,
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: animalColor[index],
                                  width: 2.0
                                )
                              ),
                      child: GestureDetector(
                              onTap: () => pickAni(index),
                        child: Image.asset(
                          widget.list[index].imagePath
                          
                        ),
                      ),
                    );
                  },
                ),
              ),


            Text(iamgeName),
            ElevatedButton(
              onPressed: () => _showD(),
              child: const Text('동물 추가하기'),
            ),
          ],
        ),
      ),
    );
  }

// Function------
  _radioChange(value) {
    _radioValue = value;
    setState(() {});
  }

  _showD() {
    var animal = Animal(
        imagePath: _imagePath,
        animalName: nameController.text,
        kind: getKind(_radioValue),
        flyExist: flyExist);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            '동물 추가하기',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text('이 동물은 $Aname 입니다. \n'
              '또 이 동물의 종류는 ${animal.kind} 입니다. \n'
              '이 동물은 ${animal.flyExist ? "날수 있습니다." : " 날 수 없습니다."}\n'
              '이 동물을 추가하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                widget.list.add(animal);
                Navigator.of(context).pop();
              },
              child: const Text('예'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('아니오'),
            ),
          ],
        );
      },
    );
  }

  String getKind(int radioValue) {
    String returnValue = "";
    switch (radioValue) {
      case 0:
        returnValue = '양서류';
        break;
      case 1:
        returnValue = '파충류';
        break;
      case 2:
        returnValue = '포유류';
        break;
        
    }
    return returnValue;
  }


  pickAni(index) {
        for(int i =0; i < animalColor.length; i++) {
            animalColor[i] = Colors.yellow;
        }
       animalColor[index] = Colors.red;
       getAnimalName = widget.list[index].animalName;
       Aname = widget.list[index].animalName;
       setState(() {});
  }
}

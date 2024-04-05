import 'package:flutter/material.dart';
import 'package:textfield_login_app/model/saved.dart';
import 'package:textfield_login_app/view/anilist.dart';
import 'package:textfield_login_app/view/bar.dart';


class Home extends StatefulWidget {
  //final  List<String> user;
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController userIdController;
  late TextEditingController userPwController;
  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController();
    userPwController = TextEditingController();
    animalList = [];

addList() {
  animalList.add(Animal(imagePath: 'images/bee.png', animalName: '벌 ', kind: '곤충', flyExist: true));
  animalList.add(Animal(imagePath: 'images/cat.png', animalName: '고양이 ', kind: '포유류', flyExist: false));
  animalList.add(Animal(imagePath: 'images/cow.png', animalName: '소', kind: '포유류', flyExist: false));
  animalList.add(Animal(imagePath: 'images/dog.png', animalName: '개 ', kind: '포유류', flyExist: false));
  animalList.add(Animal(imagePath: 'images/fox.png', animalName: '여우', kind: '포유류', flyExist: false));
  animalList.add(Animal(imagePath: 'images/monkey.png', animalName: '원숭이', kind: '영장류', flyExist: false));
  animalList.add(Animal(imagePath: 'images/pig.png', animalName: '돼지', kind: '포유류', flyExist: false));
  animalList.add(Animal(imagePath: 'images/wolf.png', animalName: '늑대', kind: '포유류', flyExist: false));
}

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Log in'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/icon.png'),
                    radius: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: userIdController,
                    decoration: const InputDecoration(
                      labelText: '사용자 ID를 입력하세요',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: userPwController,
                    decoration: const InputDecoration(
                      labelText: '사용자 PW를 입력하세요',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                ElevatedButton(
                    onPressed: () => checkIdPassword(),
                    child: const Text('Log In'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkIdPassword() {
    if (userIdController.text.trim().isEmpty ||
        userPwController.text.trim().isEmpty) {
      errorSnackBar();
    } else {
      if (userIdController.text.trim() == 'root' &&
          userPwController.text.trim() == 'qwer1234') {
        _showDialog();
      } else {
        warnSnackBar();
      }
    }
  }

  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 Id와 Pw 를 입력하세요.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('환영합니다.'),
          content: const Text('신분이 확인 되었습니다.'),
          actions: [
            TextButton(
                onPressed: () {
                  //widget.user.add(userIdController.text),
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Bar();
                    },
                  ));
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  }

  warnSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 Id나 암호가 일치하지 않습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

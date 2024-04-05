import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getstorage_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController useridController;
  late TextEditingController userpwController;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    useridController = TextEditingController();
    userpwController = TextEditingController();
    initStorage();
  }

  initStorage() {
    box.write('p_userid', "");
    box.write('p_userpw', "");
  }

  @override
  void dispose() {
    // 앱이 죽기 전에 해줘야 한다.
    disposeStorage();
    super.dispose();
  }

  disposeStorage() {
    box.erase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Center(
            
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Padding(
              padding: EdgeInsets.all(60.0),
              child: CircleAvatar(
                radius: 100,
                //backgroundImage: AssetImage(assetName),
                child: Icon(Icons.account_circle,color: Colors.blue, size: 200,),
                
                
              ),
            ),

            SizedBox(
              width: 330,
              child: TextField(
                controller: useridController,
                autofocus: true,
                //expands: false,
                onTap: () {
                
                },
                
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: '사용자 ID를 입력하세요'
                ),
              ),
            ),
            SizedBox(
              width: 330,
              child: TextField(
                controller: userpwController,
                obscureText: true,
                  textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: '패스워드를 입력하세요',
                  alignLabelWithHint: false,
                  
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (useridController.text.isEmpty || userpwController.text.isEmpty) {
                            showMessage();
                    }else {
                    showDialog();
                    saveStorage();
                    //Get.to(const SecondPage());
                    }
                  },
                  child: const Text('Log In')),
            )
          ],
        ),
      ),
    );
  }

  saveStorage() {
    box.write('p_userid', useridController.text);
    box.write('p_userpw', userpwController.text);
  }

  showMessage() {
      Get.snackbar(' 경고', '사용자 정보를 모두 입력하세요.',
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP);
  }

  showDialog() {
     Get.defaultDialog(
        title: '환영합니다.',
        middleText: '신분이 확인 되었습니다.',
        backgroundColor: Colors.white60,
        barrierDismissible: false,
        actions: [
          TextButton(onPressed: () => Get.to(const SecondPage()), child: const Text('Exit')),
        ]);
  }
}

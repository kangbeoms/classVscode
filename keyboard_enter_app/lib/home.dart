import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

late TextEditingController textEditingController;
late String inputValue;

@override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    inputValue = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Keyboard Enter'),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '글자를 입력하세요'
                ),
                keyboardType: TextInputType.text,
      
                textInputAction: TextInputAction.go,
                onSubmitted: (value) {
                  if(textEditingController.text.isEmpty) {
                      errorSnackbar();
                  }else {
                    inputValue = textEditingController.text;
                    showSnackbar();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }


  errorSnackbar() {
      Get.snackbar(
          '경고',
         '글자를 입력하세요',
         snackPosition: SnackPosition.TOP,
         duration: const Duration(seconds: 2),
         colorText: Theme.of(context).colorScheme.onError,
         backgroundColor: Theme.of(context).colorScheme.error
         );
  }


  showSnackbar() {
 Get.snackbar(
          '입력 완료',
         '입력한 글자는 $inputValue',
         snackPosition: SnackPosition.TOP,
         duration: const Duration(seconds: 2),
         colorText: Theme.of(context).colorScheme.onTertiary,
         backgroundColor: Theme.of(context).colorScheme.tertiary
         );
  }
}
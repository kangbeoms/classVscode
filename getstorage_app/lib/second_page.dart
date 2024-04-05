import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  late String userid;
  late String userpw;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    userid = "";
    userpw = "";
    initStorage();
  }

  initStorage() {
    userid = box.read('p_userid');
    userpw = box.read('p_userpw');
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('user id : $userid'),
            Text('user pw : $userpw')
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  late String userid;
  late String pw;

  @override
  void initState() {
    super.initState();
    userid = "";
    pw = "";
    isp();
  }

  isp() async{
    final prefs = await SharedPreferences.getInstance();
    userid =  prefs.getString('p_userid')!;
    pw = prefs.getString('p_userpw')!;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('user Id : $userid'),
            Text('pw : $pw')
          ],
        ),
      ),
    );
  }
}
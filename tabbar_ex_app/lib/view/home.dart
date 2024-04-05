import 'package:flutter/material.dart';
import 'package:tabbar_ex_app/view/page1.dart';
import 'package:tabbar_ex_app/view/page2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 탭바'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
        body: TabBarView(
        controller: controller,
        children: const [
              FirstPage(),
              SecondPage()
        ],
        ),
          bottomNavigationBar: Container(

          color: Colors.transparent,
          height: 80,
          child: TabBar(
            
            labelColor: Colors.blue,
            indicatorColor: Colors.black54,
            indicatorWeight: 3,
            
            controller: controller,
            tabs: const [
              Tab(
                icon: Icon(Icons.arrow_back_ios_new_outlined),
                text: '뒤로',

              ),
              Tab(
                icon: Icon(Icons.arrow_forward_ios_outlined),
                text: '앞으로',
              )
            ],
          )
    )
    );
  }
}
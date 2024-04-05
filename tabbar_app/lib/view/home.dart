import 'package:flutter/material.dart';
import 'package:tabbar_app/view/first_page.dart';
import 'package:tabbar_app/view/second_page.dart';

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
        title: const Text('Tabbar Test'),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(),
          SecondPage()
        ],
        ),
        bottomNavigationBar: Container(

          color: Colors.amber,
          height: 80,
          child: TabBar(
            
            labelColor: Colors.blue,
            indicatorColor: Colors.red,
            indicatorWeight: 3,
            
            controller: controller,
            tabs: [
              Tab(
                icon: Image.asset(
                  'images/ani3_2.webp',
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
                
                
                text: 'one',
              ),
              Tab(
                icon: Image.asset(
                  'images/ani3_3.webp',
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                  
                ),
                text: 'two',
              )
            ] 
            ),
        ),
      
    );
  }
}
import 'package:flutter/material.dart';
import 'package:webview_tabbar_tex_app/web_body.dart';

class Home extends StatefulWidget {
  final String siteName;
  const Home({super.key, required this.siteName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

late TabController controller;
late List siteName;

@override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    siteName = ['www.naver.com', 'www.google.com','www.daum.net'];
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
        title: const Text('webview - Tabbar'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          WebBody(siteName: siteName[0]),
          WebBody(siteName: siteName[1]),
          WebBody(siteName: siteName[2]),
        ],
          ),
          bottomNavigationBar: TabBar(
            tabs:[
                Tab(
                  icon: Image.asset(
                    'images/naver.com'
                  ),
                ),
                 Tab(
                  icon: Image.asset(
                    'images/google.com'
                  ),
                 ),
                 Tab(
                  icon: Image.asset(
                    'images/daum.net'
                  
                  ),
                 ) 
            ]),

        ),
    
  }
}
import 'package:flutter/material.dart';
import 'package:webview_tabbar_app/model/saveData.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [

          SaveData(whatSite: 'www.naver.com'),
          SaveData(whatSite: 'www.google.com'),
          SaveData(whatSite: 'www.daum.net')


       
        ],
      ),
      bottomNavigationBar: TabBar(controller: tabController, tabs: [
        Tab(
          icon: Image.asset('images/naver.png',
          width: 30,),
          text: '네이버',
        ),
        Tab(
          icon: Image.asset('images/google.png',
          width: 30,),
          text: '구글',
        ),
        Tab(
          icon: Image.asset('images/daum.png',
          width: 30,),
          text: '다음',
        )
      ]
      ),
    );
  }
}

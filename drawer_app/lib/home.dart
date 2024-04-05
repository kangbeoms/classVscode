import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Drawer')],
        ),
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
        children:  [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/ani1.jpg'),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage('images/ani2.webp'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/ani3.jpeg'),
              )
            ],
            accountName: Text('animal1'),
            accountEmail: Text('tvzz1105@naver.com'),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.red,
              ),
            title: const Text('Home'),
            onTap: () {
              print('Home is clicked');         
            },
            
          ),
          Icon(Icons.settings),
          Icon(Icons.question_answer)
        ],
      )),
    );
  }
}

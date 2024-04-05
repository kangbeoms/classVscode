

import 'package:collection_view_label_app/model/savedate.dart';
import 'package:collection_view_label_app/view/detail.dart';
import 'package:collection_view_label_app/view/update.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> heroList;

  @override
  void initState() {
    super.initState();

    heroList = ['가', '나', '다', '라', '마', '바', '사', '아', '자', '차'];

  

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('삼국지 인물'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Update())).then((value) => noThx());
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: heroList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.black54,
              child: GestureDetector(
                onTap: () {
                  SaveData.text = heroList[index];
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Detail()));
                },
                child: Card(
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(heroList[index])],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  noThx() {
    if ( SaveData.nono == true) {
      heroList.add(SaveData.text);  
        SaveData.nono = false;
        setState(() {});
    }
  }
}

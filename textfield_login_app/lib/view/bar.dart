import 'package:flutter/material.dart';
import 'package:textfield_login_app/model/saved.dart';
import 'package:textfield_login_app/view/anilist.dart';
import 'package:textfield_login_app/view/insertpage.dart';


class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _HomeState();
}

class _HomeState extends State<Bar> with SingleTickerProviderStateMixin{

  // Property
  late TabController controller;
  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    animalList = [];
    addList();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  addList(){
    animalList.add(Animal(
      imagePath: 'images/bee.png', 
      animalName: '벌', 
      kind: "곤충", 
      flyExist: true));

    animalList.add(Animal(
      imagePath: 'images/cat.png', 
      animalName: '고양이', 
      kind: "포유류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/cow.png', 
      animalName: '젖소', 
      kind: "포유류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/dog.png', 
      animalName: '강아지', 
      kind: "포유류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/fox.png', 
      animalName: '여우', 
      kind: "포유류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/monkey.png', 
      animalName: '원숭이', 
      kind: "영장류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/pig.png', 
      animalName: '돼지', 
      kind: "포유류", 
      flyExist: false));

    animalList.add(Animal(
      imagePath: 'images/wolf.png', 
      animalName: '늑대', 
      kind: "포유류", 
      flyExist: false));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Test'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          AniList(list: animalList),
          InsertPage(list: animalList)
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red
            ),
          )
        ],
      ),
    );
  }
}
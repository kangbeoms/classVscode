import 'package:flutter/material.dart';
import 'package:listview_app/staticclass.dart';


import 'saved.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HoemState();
}

class _HoemState extends State<Home> {

late List<Saved> aniList;

late String alertTitle;


@override
  void initState() {
    super.initState();
    alertTitle ='';
    aniList =[];
    addList();
  }

  addList() {
      aniList.add(Saved(image: 'images/bee.png', text: '벌'));
      aniList.add(Saved(image: 'images/cat.png', text: '고양이'));
      aniList.add(Saved(image: 'images/cow.png', text: '소'));
      aniList.add(Saved(image: 'images/dog.png', text: '개'));
      aniList.add(Saved(image: 'images/fox.png', text: '여우'));
      aniList.add(Saved(image: 'images/monkey.png', text: '원숭이'));
      aniList.add(Saved(image: 'images/pig.png', text: '돼지'));
      aniList.add(Saved(image: 'images/wolf.png', text: '늑대'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동물리스트'),
      ),
      body: ListView.builder(
        itemCount: aniList.length,
        itemBuilder: (context, index) {
          
          return 
          
          GestureDetector(
            onTap: () {
                Datathing.name = aniList[index].text;
                showAlert(context);
            },
            child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      aniList[index].image,
                    ),
                    Text(
                      aniList[index].text
                    )
                  ],
                ),
                ),
          );
        },
        ),
    );
  }






showAlert(BuildContext context) {
  showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (BuildContext ctx) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title:  Text(Datathing.name),
            content:  Text('  ${Datathing.name == '벌' ? '이 곤충은' : '이 동물은 포유류'} 입니다. \n ' 
                        '${Datathing.name == '벌' ? '이 곤충은 날 수 있습니다.' : '이 동물은 날 수 없습니다.'}'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('종료'),
                  ),
              )
            ],
          );
      },
      );
}


}
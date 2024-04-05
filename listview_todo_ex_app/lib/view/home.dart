import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

import '../model/savedData.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<savedData>  showList;

  @override
  void initState() {
    super.initState();

    showList =[];
    addData();
  }

addData ()
 {
  showList.add(savedData(imagesPath: 'images/cart.png', content: '책구매'));
  showList.add(savedData(imagesPath: 'images/clock.png', content: '약속'));
  showList.add(savedData(imagesPath: 'images/pencil.png', content: '스터디 준비'));
 }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Main view'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
           IconButton(
                onPressed: () => Navigator.pushNamed(context, '/insert').then((value) => check()),
                icon: const Icon(Icons.add_outlined),
              ),

        ],
      ),
      body: ListView.builder(
        itemCount: showList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 100,
            height: 100,
            child: GestureDetector(
              onTap: () {
                  Message.text = showList[index].content;
                  Message.image = showList[index].imagesPath;
                  Navigator.pushNamed(context, '/detail');
              },
              child: Card(
                child:   
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                          showList[index].imagesPath,
                        
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          showList[index].content
                        ),
                      )
                  ],
              ),
              ),
              
           
            ),
          );
        },
          
       
        
        ),
    );
  }

check() {
  if(Message.what == true) {
     showList.add(savedData(imagesPath: Message.image, content: Message.text)); 

    Message.what = false;
  setState(() { });
  }
}



}
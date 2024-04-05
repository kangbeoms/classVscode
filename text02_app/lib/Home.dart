import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text with Row and column'),
        ),
      body:  const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.email_rounded,
                      color: Colors.blue,
                    ),
                  ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                      Icons.account_circle
                                        ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                      Icons.account_balance
                                        ),
                    )
                ],
              
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 패딩을 상하 좌우 비율을 보고 간격을 정해준다
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('James'),
                    ),
                    Padding(
                      // 전체적인 간격을 지정할 때
                      padding: EdgeInsets.all(10.0),
                      child: Text('Cathy'),
                    ),
                    Padding(
                       // 간격을 하나하나 컨트롤 할 때
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text('Kenny'),
                    )
                ],
              )
          ],
          )
      ),
    );
  }
}
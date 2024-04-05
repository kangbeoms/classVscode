import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buttons'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 기능은 무조건 함수의 모양을 한다
              TextButton(
                onLongPress: () => print('text buttone'),
                onPressed: () {
                int intNum = 10;
                int intNum2 = 20;
                print('$intNum + $intNum2 = ${intNum+intNum2}');
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.red
              ),
                          child: const Text(
                            'Text Button',
                            style: TextStyle(
                              fontSize: 20,
                              //color: Colors.blue,
        
                            ),
                          ),
              ),
              ElevatedButton(
                onPressed: () => print('ElevatedButton'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
                ), 
                child: const Text('EleavtedButton'),
                ),
                OutlinedButton(
                  onPressed:() => print('OutlinedButton'), 
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    side: const BorderSide(
                      color: Colors.black,
                      width: 2.0
                    )
                  ),
                  child: const Text('OutlinedButton'),
                
                ),
                TextButton.icon(
                  onPressed: () => print('Text Button Icon'),
                    icon: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.red,
        
                    ),
                    label: const Text('Go to home'),
                    style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
        
                    ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => print('Elevated Button Icon'),
                     icon: Icon(
                      Icons.home,
                     ), 
                     label: const Text('home'),
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(150, 50)
                     ),
                     ),
                     OutlinedButton.icon(
                      onPressed: () => print('Go to home'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: BorderSide(
                          width: 0.3,
                        ),
                        shape: ContinuousRectangleBorder(
        
                        )
                      ),
                      icon: Icon(
                        Icons.home,
                      ),
                      label: const Text('Go to home'),
        
                      ),
                
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => print('Text Button'),
                              style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                              backgroundColor: Colors.white
                              ),
                              child: Text('TextButton')
                              ),
                              ElevatedButton(
                              onPressed: () => print('ElevatedButton'),
                              
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue,
                                minimumSize: const Size(140, 40),
                                
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                )
                        
                                
                              ),
                              child: Text('ElevatedButton'),
                              
                              )
                          ],
                        ),
                      )
            ],
            )
          ),
    );
  }
}
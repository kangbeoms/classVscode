import 'package:flutter/material.dart';
import 'package:my_test_app/go.dart';

class Home extends StatefulWidget {
  final List<String> data;
  const Home({super.key, required this.data});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

    @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
ElevatedButton(
        
                onPressed: () {

                 // widget.data.add('aaa');
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Go(data: 'kkk')));
                  
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
                ), 
                child: const Text('EleavtedButton'),
                ),
          ],
          ),
      )
      
    );
  }
}
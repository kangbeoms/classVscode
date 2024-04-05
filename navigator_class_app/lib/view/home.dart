import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('main page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/1st'),
                child: const Text('go to the screen #1',
                ),
                style:  ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                    
                  )
                )             
                ),

                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/2nd'),
                  child: const Text('go to the screen 2#'),
                    style:  ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(3)
                  )
                )             
                  ),

          ],
          ),
          
      ),
    );
  }
}
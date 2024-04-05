import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: const Column(
              children: [
                Text('Navigator_AppBar'),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/send'),
                icon: const Icon(Icons.email),
              ),
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/received'),
                icon: const Icon(Icons.email_outlined),
              )
            ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/send'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7))),
                  child: const Text('보낸 편지함'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/received'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7))),
                  child: const Text('받은 편지함'),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/ani1.jpg'
                  ),
                ),
                accountName: Text('animal'),
               accountEmail: Text('tvzz105@naver.com'),
               decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                )
               ),
               
               ),
               ListTile(
                  leading: Icon(
                    Icons.mail,
                  color: Colors.blue,),
                  title: Text(' 보낸 편지함'),
                  onTap: () {  
                   Navigator.pushNamed(context, '/send');
                  },
                  ),
                
                ListTile(
                leading: Icon(
                    Icons.mail,
                  color: Colors.red,),
                  title: Text(' 받은 편지함'),
                  onTap: () {
                  Navigator.pushNamed(context, '/received');
                  },
                  ),
            ],
          )
        ),
        );
  }
}

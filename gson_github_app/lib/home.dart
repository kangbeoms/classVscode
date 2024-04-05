import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

late List data;

@override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }
getJSONData() async {
var url = Uri.parse('https://zeushahn.github.io/Test/student.json');
var response = await http.get(url);
var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
List result = dataConvertedJSON['results'];
data.addAll(result);
print(data);
setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test'),
      ),
      body: Center(
        child: data.isEmpty ? 
              const Text('데이터가 없습니다.',
              style: TextStyle(
                fontSize: 20,
        
              ),
              textAlign: TextAlign.center,
              ) 
            : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => cardBuild(context, index), 
              ),
      )
    );
  }

  
    
    Widget cardBuild(BuildContext context, int index) {

      return 
      Card(
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Code',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(data[index]['code'].toString()),

              ],
            ),
            Text('phone',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
             Text(data[index]['phone'].toString())
          ],
        ),
      );
    }

  

}

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
late int count;

@override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
    count =0;
  
  }
getJSONData() async {
var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
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
        title: const Text('JSON Movie'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: data.isEmpty ?
                CircularProgressIndicator()
              :  ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              data[index]['image'],
                              width: 100,
                              height: 150,
                            ),
                          ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data[index]['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      )
                        ],
                      )
                    ],
                  ),
                );
              },
                 ),
    );
  }
}
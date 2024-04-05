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
    count = 0;
  }

  getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/cards.json');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));

    List result = dataConvertedJSON['results'];
    data.addAll(result);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white70,
      ),
      body: data.isEmpty
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueGrey[900],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.network(data[index]['image'].toString()),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 400,
                            height: 40,
                            child: Text(
                              data[index]['category'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 400,
                        height: 80,
                        child: Text(
                          data[index]['heading'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data[index]['author'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                                fontSize: 13),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}

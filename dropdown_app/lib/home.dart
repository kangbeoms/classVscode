import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> items;
  late String dropDownValue;
  late String imageName;

  @override
  void initState() {
    super.initState();
    items = ['bee', 'cat', 'cow', 'dog', 'fox', 'monkey', 'pig', 'wolf'];
    dropDownValue = 'bee';
    imageName = 'bee';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drop Down Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              dropdownColor: Theme.of(context).colorScheme.primaryContainer,
              iconEnabledColor: Theme.of(context).colorScheme.secondary,
              value: dropDownValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                dropDownValue = value!;
                imageName = value;
                setState(() {});
              },
            ),
            Image.asset(
              'images/$imageName.png',
              width: 200,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}

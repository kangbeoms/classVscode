
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late DateTime date;
  late String selectDatetext;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    selectDatetext = "";
    //print(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '현재 일자는 ${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} 입니다.'),
            ElevatedButton(
              onPressed: () => dispDatePicker(),
              child: const Text('Date Picker'),
            ),
            Text(selectDatetext)
          ],
        ),
      ),
    );
  }

// -Function-
  dispDatePicker() async {
    // Picker 의 범위
    int firstYear = date.year - 1;
    int lastYear = firstYear + 5;

    final selectedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(firstYear),
        lastDate: DateTime(lastYear),
        initialEntryMode: DatePickerEntryMode.calendar,
        locale: const Locale('ko', 'KR'));
    if (selectedDate != null) {
      selectDatetext = "선택하신 일자는 ${selectedDate.toString().substring(0,10)} 입니다.";
    }
      setState(() {});
  }
  
}

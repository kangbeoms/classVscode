import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'developer_data.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //Property
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    data = [];
    tooltipBehavior = TooltipBehavior(enable: true);
    addData();
    
  }

  addData() {
    data.add(DeveloperData(year: 2017, developers: 19000));
    data.add(DeveloperData(year: 2018, developers: 40000));
    data.add(DeveloperData(year: 2019, developers: 35000));
    data.add(DeveloperData(year: 2020, developers: 37000));
    data.add(DeveloperData(year: 2021, developers: 45000));
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 380,
              height: 600,
              child: SfCircularChart(
                backgroundImage: const AssetImage('images/daum.png'),
                borderWidth: 50,
                title: const ChartTitle(
                  text: 'Yearly Growth in the Flutter Community',
                ),
              
                tooltipBehavior: tooltipBehavior,
                series: <CircularSeries<DeveloperData, int>>[
                      PieSeries<DeveloperData, int>(
                        dataSource: data,
                        explode: true,
                        selectionBehavior: SelectionBehavior(enable: true),
                        xValueMapper: (DeveloperData developers, _) => developers.year,
                        yValueMapper: (DeveloperData developers, _) => developers.developers,
                        dataLabelSettings: const DataLabelSettings(isVisible: true),
                        enableTooltip: true,
                      )
                  
                  
                      
                ],
                
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

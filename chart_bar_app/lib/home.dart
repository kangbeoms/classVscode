import 'package:chart_bar_app/second.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'developer_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//Property
  late List<DeveloperData> data;
  late List<DeveloperData> data2;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    data = [];
    data2 = [];
    tooltipBehavior = TooltipBehavior(enable: true);
    addData();
    addData2();
  }

  addData() {
    data.add(DeveloperData(year: 2017, developers: 19000));
    data.add(DeveloperData(year: 2018, developers: 40000));
    data.add(DeveloperData(year: 2019, developers: 35000));
    data.add(DeveloperData(year: 2020, developers: 37000));
    data.add(DeveloperData(year: 2021, developers: 45000));
  }

  addData2() {
    data2.add(DeveloperData(year: 2017, developers: 9000));
    data2.add(DeveloperData(year: 2018, developers: 20000));
    data2.add(DeveloperData(year: 2019, developers: 17000));
    data2.add(DeveloperData(year: 2020, developers: 18000));
    data2.add(DeveloperData(year: 2021, developers: 30000));
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
              child: SfCartesianChart(
                title: const ChartTitle(
                  text: 'Yearly Growth in the Flutter Community',
                ),
                legend: const Legend(isVisible: true),
                tooltipBehavior: tooltipBehavior,
                series: [
                  //ColumnSeries :  세로 막대그래프
                  //BarSeries : 가로 막대그래프
                  //LineSeries : 선그래프
                  //scatterSeries : 점그래프
            
                  ColumnSeries<DeveloperData, int>(
                    color: Colors.amber,
                    dataSource: data,
                    // 모델에서 데이터를 잡아둔게 두가지라서 두개를 적어야 하나 안쓸거라 _로 표현
                    xValueMapper: (DeveloperData developers, _) => developers.year,
                    yValueMapper: (DeveloperData developers, _) =>
                        developers.developers,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true,
                  ),
                    ColumnSeries<DeveloperData, int>(
                    color: Colors.blueAccent,
                    dataSource: data2,
                    // 모델에서 데이터를 잡아둔게 두가지라서 두개를 적어야 하나 안쓸거라 _로 표현
                    xValueMapper: (DeveloperData developers, _) => developers.year,
                    yValueMapper: (DeveloperData developers, _) =>
                        developers.developers,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true,
                  ),
                      
                ],
                // x축을 category로 표현
                primaryXAxis: const CategoryAxis(
                  title: AxisTitle(text: '년도'),
                ),
                // y 축을 숫자로 표현
                primaryYAxis: const NumericAxis(
                  title: AxisTitle(text: 'Community수'),
                ),
              ),
            ),
            ElevatedButton(
              onPressed:() => Get.to(const SecondPage()), 
             child: const Text('PieChart'), 
             ),
          ],
        ),
      ),
    );
  }
}

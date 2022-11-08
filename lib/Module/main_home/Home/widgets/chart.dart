import 'package:flutter/material.dart';
import 'package:my_expenses/Model/pie_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';

class PieChart extends StatelessWidget {
  List<PieData>? pieData;
  PieChart({this.pieData});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfCircularChart(
            title: ChartTitle(text: 'myexpenses'.tr),
            legend: Legend(isVisible: true),
            series: <CircularSeries<PieData, String>>[
          PieSeries<PieData, String>(
              explode: true,
              explodeIndex: 0,
              dataSource: pieData,
              xValueMapper: (PieData data, _) => data.xData,
              yValueMapper: (PieData data, _) => data.yData,
              dataLabelMapper: (PieData data, _) => data.text,
              dataLabelSettings: const DataLabelSettings(isVisible: true)),
        ]));
  }
}

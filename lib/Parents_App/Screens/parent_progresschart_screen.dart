import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Constrant/common_widgets.dart';
import '../Controllers/parents_progress_controller.dart';

class ParentProgresschartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ParentsProgressController controller =
        Get.put(ParentsProgressController());

    return Scaffold(
      appBar: AppBar(
        title: CommonWidgets().textWidget(
          text: "Student Progress",
          textWeight: FontWeight.bold,
          textSize: 17.0,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfCircularChart(
                // Enables the legend
                legend: Legend(
                  isVisible: true,
                  iconHeight: 20,
                  iconWidth: 20,
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                series: <CircularSeries>[
                  // Initialize line series
                  PieSeries<ChartData, String>(
                      dataSource: controller.chartData,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      emptyPointSettings:
                          EmptyPointSettings(mode: EmptyPointMode.average),
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      name: 'Data')
                ]),
          ),
        ],
      ),
    );
  }
}

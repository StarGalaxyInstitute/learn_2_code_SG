import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentsProgressController extends GetxController {
  final List<ChartData> chartData = [
    ChartData('Jan', 5),
    ChartData('Feb', 10),
    ChartData('Mar', 15),
    ChartData('Apr', 20),
    ChartData('May', 30),
    ChartData('jun', 40),
    ChartData('jul', 50),
    ChartData('aug', 60),
    ChartData('sep', 70),
    ChartData('oct', 80),
    ChartData('nov', 90),
    ChartData('dec', 95)
  ];
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

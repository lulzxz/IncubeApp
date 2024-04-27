import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AspectRatio(
          aspectRatio: 5,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: BarChart(
              BarChartData(
                barGroups: [
                  BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10)]),
                  BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 4)]),
                  BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 6)]),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

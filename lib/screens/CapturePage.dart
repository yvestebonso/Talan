import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineCharts extends StatelessWidget {
  const LineCharts({super.key});

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Doline';
        break;
      case 1:
        text = 'BEN';
        break;
      case 2:
        text = 'YVES ';
        break;
      case 3:
        text = 'ANDY';
        break;
      case 4:
        text = 'SAIIDA';
        break;
      case 5:
        text = 'FABRICE';
        break;

      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: _dateTextStyle),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.black, fontSize: 12);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text('\$ ${value + 0.5}', style: style),
    );
  }

  static const _dateTextStyle = TextStyle(
    fontSize: 10,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    const cutOffYValue = 5.0;

    return AspectRatio(
      aspectRatio: 2.4,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 24),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 5),
                  FlSpot(1, 10),
                  FlSpot(2, 15),
                  FlSpot(3, 20),
                  FlSpot(4, 25),
                  FlSpot(5, 30),
                ],
                isCurved: true,
                barWidth: 8,
                color: Colors.purpleAccent,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.deepPurple.withOpacity(0.4),
                  cutOffY: cutOffYValue,
                  applyCutOffY: true,
                ),
                aboveBarData: BarAreaData(
                  show: true,
                  color: Colors.orange.withOpacity(0.6),
                  cutOffY: cutOffYValue,
                  applyCutOffY: true,
                ),
                dotData: FlDotData(
                  show: false,
                ),
              ),
            ],
            minY: 0,
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                axisNameWidget: const Text(
                  'Time',
                  style: _dateTextStyle,
                ),
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 18,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                axisNameSize: 20,
                axisNameWidget: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text('Value'),
                ),
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  reservedSize: 40,
                  getTitlesWidget: leftTitleWidgets,
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 1,
              checkToShowHorizontalLine: (double value) {
                return value == 1 || value == 6 || value == 4 || value == 5;
              },
            ),
          ),
        ),
      ),
    );
  }
}
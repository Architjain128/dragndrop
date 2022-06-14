import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CombinedChartPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  CombinedChartPage({Key? key}) : super(key: key);

  @override
  _CombinedChartPageState createState() => _CombinedChartPageState();
}

class _CombinedChartPageState extends State<CombinedChartPage> {
  _CombinedChartPageState();

  late double _columnWidth;
  late double _columnSpacing;
  List<_ChartData>? chartData;
  TooltipBehavior? _tooltipBehavior;
  List<_ChartData> data = [];
  @override
  void initState() {
    _columnWidth = 0.8;
    _columnSpacing = 0.2;
    _tooltipBehavior = TooltipBehavior(enable: true);
    data = <_ChartData>[
      _ChartData([
        1,
        2,
        1.5,
        2.3,
        1.2
      ], [
        10,
        20,
        15,
        23,
        12
      ], [
        "A",
        "B",
        "C",
        "D",
        "E"
      ], [
        "a",
        "b",
        "c",
        "d",
        "e"
      ]),
      _ChartData([
        1,
        2,
        1.5,
        2.3,
        1.2
      ], [
        10,
        20,
        15,
        23,
        12
      ], [
        "A",
        "B",
        "C",
        "D",
        "E"
      ], [
        "a",
        "b",
        "c",
        "d",
        "e"
      ]),
      _ChartData([
        1,
        2,
        1.5,
        2.3,
        1.2
      ], [
        10,
        20,
        15,
        23,
        12
      ], [
        "A",
        "B",
        "C",
        "D",
        "E"
      ], [
        "a",
        "b",
        "c",
        "d",
        "e"
      ]),
      _ChartData([
        1,
        2,
        1.5,
        2.3,
        1.2
      ], [
        10,
        20,
        15,
        23,
        12
      ], [
        "A",
        "B",
        "C",
        "D",
        "E"
      ], [
        "a",
        "b",
        "c",
        "d",
        "e"
      ])
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultLineChart() == null ? Text("ji") : _buildDefaultLineChart();
  }

  /// Get the cartesian chart with default line series
  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Inflation - Consumer price'),
      legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift, interval: 2, majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(labelFormat: '{value}%', axisLine: const AxisLine(width: 0), majorTickLines: const MajorTickLines(color: Colors.transparent)),
      series: _getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<ChartSeries> _getDefaultLineSeries() {
    return <LineSeries<_ChartData, String>>[
      LineSeries<_ChartData, String>(
        animationDuration: 2500,
        dataSource: data,
        xValueMapper: (_ChartData sales, _) => sales.lineName[0],
        yValueMapper: (_ChartData sales, _) => sales.line[0],
        width: 2,
        name: 'Archit',
        markerSettings: const MarkerSettings(isVisible: true),
      ),
      LineSeries<_ChartData, String>(
        animationDuration: 2500,
        dataSource: data,
        width: 2,
        name: 'Jain',
        xValueMapper: (_ChartData sales, _) => sales.lineName[1],
        yValueMapper: (_ChartData sales, _) => sales.line[1],
        markerSettings: const MarkerSettings(isVisible: true),
      ),
    ];
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(children: [
  //     //Initialize the chart widget
  //     SfCartesianChart(
  //         primaryXAxis: CategoryAxis(),
  //         // Chart title
  //         title: ChartTitle(text: 'temp'),
  //         // Enable legend
  //         legend: Legend(isVisible: true),
  //         // Enable tooltip
  //         tooltipBehavior: TooltipBehavior(enable: true),
  //         series: <ChartSeries<_ChartData, String>>[
  //           LineSeries<_ChartData, String>(
  //             dataSource: data,
  //             xValueMapper: (_ChartData sales, _) => sales.lineName[0],
  //             yValueMapper: (_ChartData sales, _) => sales.line[0],
  //             name: 'a',
  //             // Enable data label
  //             dataLabelSettings: DataLabelSettings(isVisible: true),
  //           )
  //         ]),

  // Expanded(
  //   child: Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     //Initialize the spark charts widget
  //     child: SfSparkLineChart.custom(
  //       //Enable the trackball
  //       trackball: SparkChartTrackball(activationMode: SparkChartActivationMode.tap),
  //       //Enable marker
  //       marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
  //       //Enable data label
  //       labelDisplayMode: SparkChartLabelDisplayMode.all,
  //       xValueMapper: (int index) => data[index].year,
  //       yValueMapper: (int index) => data[index].sales,
  //       dataCount: 5,
  //     ),
  //   ),
  // )
  // ]);
  // }
}

class _ChartData {
  _ChartData(this.bar, this.line, this.barName, this.lineName);
  final List<double> bar;
  final List<double> line;
  final List<String> barName;
  final List<String> lineName;
}

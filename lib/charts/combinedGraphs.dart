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
  List<String> category = [];
  List<String> categoryName = [];
  @override
  void initState() {
    _columnWidth = 0.8;
    _columnSpacing = 0.2;
    _tooltipBehavior = TooltipBehavior(enable: true);
    category = [
      "bar",
      "bar",
      "bar",
      "line",
      "line",
      "line"
    ];
    categoryName = [
      "b1",
      "b2",
      "b3",
      "l1",
      "l2",
      "l3"
    ];
    data = <_ChartData>[
      _ChartData("MSD", [
        10,
        21,
        13,
        100,
        80,
        62
      ], [
        "bar",
        "bar",
        "bar",
        "line",
        "line",
        "line"
      ], [
        "b1",
        "b2",
        "b3",
        "l1",
        "l2",
        "l3"
      ]),
      _ChartData("kohli", [
        11,
        20,
        12,
        95,
        81,
        60
      ], [
        "bar",
        "bar",
        "bar",
        "line",
        "line",
        "line"
      ], [
        "b1",
        "b2",
        "b3",
        "l1",
        "l2",
        "l3"
      ]),
      _ChartData("Rohit", [
        10,
        21,
        13,
        100,
        80,
        69
      ], [
        "bar",
        "bar",
        "bar",
        "line",
        "line",
        "line"
      ], [
        "b1",
        "b2",
        "b3",
        "l1",
        "l2",
        "l3"
      ]),
      _ChartData("Dhawan", [
        11,
        20,
        14,
        90,
        84,
        60
      ], [
        "bar",
        "bar",
        "bar",
        "line",
        "line",
        "line"
      ], [
        "b1",
        "b2",
        "b3",
        "l1",
        "l2",
        "l3"
      ]),
      _ChartData("Rahane", [
        10,
        21,
        13,
        100,
        80,
        63
      ], [
        "bar",
        "bar",
        "bar",
        "line",
        "line",
        "line"
      ], [
        "b1",
        "b2",
        "b3",
        "l1",
        "l2",
        "l3"
      ]),
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
      primaryXAxis: CategoryAxis(),
      // primaryXAxis: CategoryAxis(edgeLabelPlacement: EdgeLabelPlacement.shift, majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(labelFormat: '{value}', axisLine: const AxisLine(width: 0), majorTickLines: const MajorTickLines(color: Colors.transparent)),
      series: _getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<CartesianSeries> _getDefaultLineSeries() {
    List<CartesianSeries> chartAll = [];
    for (var i = 0; i < category.length; i++) {
      if (category[i] == "bar") {
        chartAll.add(
          ColumnSeries<_ChartData, String>(
            width: 0.8,
            spacing: 0.2,
            dataSource: data,
            xValueMapper: (_ChartData sales, _) => sales.playerName,
            yValueMapper: (_ChartData sales, _) => sales.values[i],
            name: categoryName[i],
            // width: 2,
            // animationDuration: 2500,
          ),
        );
      }
      if (category[i] == "line") {
        // chartAll.add(
        //   LineSeries<_ChartData, String>(
        //     animationDuration: 2500,
        //     dataSource: data,
        //     xValueMapper: (_ChartData sales, _) => sales.playerName,
        //     yValueMapper: (_ChartData sales, _) => sales.values[i],
        //     width: 2,
        //     name: categoryName[i],
        //     markerSettings: const MarkerSettings(isVisible: true),
        //   ),
        // );
      }
    }
    return chartAll;
    // return <LineSeries<_ChartData, String>>[
    //   LineSeries<_ChartData, String>(
    //     animationDuration: 2500,
    //     dataSource: data,
    //     xValueMapper: (_ChartData sales, _) => sales.playerName,
    //     yValueMapper: (_ChartData sales, _) => sales.values[0],
    //     width: 2,
    //     name: categoryName[i],
    //     markerSettings: const MarkerSettings(isVisible: true),
    //   ),
    //   LineSeries<_ChartData, String>(
    //     animationDuration: 2500,
    //     dataSource: data,
    //     width: 2,
    //     name: 'Jain',
    //     xValueMapper: (_ChartData sales, _) => sales.playerName,
    //     yValueMapper: (_ChartData sales, _) => sales.values[1],
    //     markerSettings: const MarkerSettings(isVisible: true),
    //   ),
    // ];
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
  _ChartData(this.playerName, this.values, this.category, this.categoryName);
  final String? playerName;
  final List<double> values;
  final List<String> category;
  final List<String> categoryName;
}

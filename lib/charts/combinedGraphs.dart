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
  late TrackballDisplayMode _mode;

  @override
  void initState() {
    _columnWidth = 0.8;
    _columnSpacing = 0.2;
    _tooltipBehavior = TooltipBehavior(enable: true);
    _mode = TrackballDisplayMode.floatAllPoints;

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
      ]),
      _ChartData("kohli", [
        11,
        20,
        12,
        95,
        81,
        60
      ]),
      _ChartData("Rohit", [
        10,
        21,
        13,
        100,
        80,
        69
      ]),
      _ChartData("Dhawan", [
        11,
        20,
        14,
        90,
        84,
        60
      ]),
      _ChartData("Rahane", [
        10,
        21,
        13,
        100,
        80,
        63
      ]),
      _ChartData("KL", [
        11,
        20,
        14,
        90,
        84,
        60
      ]),
      _ChartData("Ashwin", [
        10,
        21,
        13,
        100,
        80,
        63
      ]),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultLineChart() == null ? Text("Error") : _buildDefaultLineChart();
  }

  /// Get the cartesian chart with default line series
  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Graphical View'),
      legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: CategoryAxis(),
      // primaryXAxis: CategoryAxis(edgeLabelPlacement: EdgeLabelPlacement.shift, majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(labelFormat: '{value}', axisLine: const AxisLine(width: 0), majorTickLines: const MajorTickLines(color: Colors.transparent)),
      series: _getDefaultLineSeries(),
      trackballBehavior: TrackballBehavior(
        enable: true,
        markerSettings: TrackballMarkerSettings(
          markerVisibility: TrackballVisibilityMode.visible,
          height: 10,
          width: 10,
          borderWidth: 1,
        ),
        hideDelay: 2000,
        activationMode: ActivationMode.singleTap,
        tooltipAlignment: ChartAlignment.center,
        tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
        tooltipSettings: InteractiveTooltip(format: _mode != TrackballDisplayMode.groupAllPoints ? 'series.name : point.y' : null, canShowMarker: true),
        shouldAlwaysShow: false,
      ),
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
            spacing: 0.1,
            dataSource: data,
            xValueMapper: (_ChartData row, _) => row.playerName,
            yValueMapper: (_ChartData row, _) => row.values[i],
            name: categoryName[i],
            animationDuration: 2500,
          ),
        );
      }
      if (category[i] == "line") {
        chartAll.add(
          LineSeries<_ChartData, String>(
            animationDuration: 2500,
            dataSource: data,
            xValueMapper: (_ChartData row, _) => row.playerName,
            yValueMapper: (_ChartData row, _) => row.values[i],
            width: 2,
            name: categoryName[i],
            markerSettings: const MarkerSettings(isVisible: true),
          ),
        );
      }
    }
    return chartAll;
  }
}

class _ChartData {
  _ChartData(this.playerName, this.values);
  final String? playerName;
  final List<double> values;
}

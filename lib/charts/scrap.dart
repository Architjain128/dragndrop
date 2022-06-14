// import 'dart:async';

/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// State class of the chart with pinch zooming.
class _DefaultPanningState extends SampleViewState {
  _DefaultPanningState();
  late List<String> _zoomModeTypeList;
  late String _selectedModeType;
  late ZoomMode _zoomModeType;
  late bool _enableAnchor;
  late GlobalKey<State> chartKey;
  late num left, top;
  late List<ChartSampleData> randomData;
  @override
  void initState() {
    _zoomModeTypeList = <String>[
      'x',
      'y',
      'xy'
    ].toList();
    _selectedModeType = 'x';
    _zoomModeType = ZoomMode.x;
    chartKey = GlobalKey<State>();
    _enableAnchor = true;
    left = 0;
    top = 0;
    getDateTimeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      _buildDefaultPanningChart(),
    ]);
  }

  /// Returns the cartesian chart with pinch zoomings.
  SfCartesianChart _buildDefaultPanningChart() {
    return SfCartesianChart(
        key: chartKey,
        plotAreaBorderWidth: 0,
        primaryXAxis: DateTimeAxis(name: 'X-Axis', majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(axisLine: const AxisLine(width: 0), anchorRangeToVisiblePoints: _enableAnchor, majorTickLines: const MajorTickLines(size: 0)),
        series: getDefaultPanningSeries(),
        zoomPanBehavior: ZoomPanBehavior(

            /// To enable the pinch zooming as true.
            enablePinching: true,
            zoomMode: ZoomMode.x,
            enablePanning: true,
            enableMouseWheelZooming: model.isWebFullView ? true : false));
  }

  /// Returns the list of chart series
  /// which need to render on the chart with pinch zooming.
  List<AreaSeries<ChartSampleData, DateTime>> getDefaultPanningSeries() {
    return <AreaSeries<ChartSampleData, DateTime>>[
      AreaSeries<ChartSampleData, DateTime>(
          dataSource: randomData,
          xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          gradient: LinearGradient(colors: <Color>[
            Colors.teal[50]!,
            Colors.teal[200]!,
            Colors.teal
          ], stops: const <double>[
            0.0,
            0.4,
            1.0
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
    ];
  }

  /// Method to get chart data points.
  void getDateTimeData() {
    randomData = <ChartSampleData>[];
  }

  /// Method to update the selected zoom type in the chart on change.

  void _enableRangeCalculation(bool enableZoom) {
    _enableAnchor = enableZoom;
    setState(() {});
  }
}

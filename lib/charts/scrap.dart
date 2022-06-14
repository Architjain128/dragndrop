// /// Package imports
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// /// Chart import
// import 'package:syncfusion_flutter_charts/charts.dart';

// /// Local imports

// /// State class the chart with default trackball.
// class _DefaultTrackballState extends SampleViewState {
//   _DefaultTrackballState();
//   late double duration;
//   late bool showAlways;
//   late bool canShowMarker;
//   late List<String> _modeList;
//   late String _selectedMode;
//   late TrackballDisplayMode _mode;
//   late List<String> _alignmentList;
//   late String _tooltipAlignment;
//   late bool _showMarker;
//   late ChartAlignment _alignment;
//   late List<ChartSampleData> chartData;

//   @override
//   void initState() {
//     _modeList = <String>['floatAllPoints', 'groupAllPoints', 'nearestPoint'].toList();
//     _alignmentList = <String>['center', 'far', 'near'].toList();
//     duration = 2;
//     showAlways = false;
//     canShowMarker = true;
//     _selectedMode = 'floatAllPoints';
//     _mode = TrackballDisplayMode.floatAllPoints;
//     _tooltipAlignment = 'center';
//     _showMarker = true;
//     _alignment = ChartAlignment.center;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _buildDefaultTrackballChart();
//   }

//   /// Returns the cartesian chart with default trackball.
//   SfCartesianChart _buildDefaultTrackballChart() {
//     return SfCartesianChart(
//       title: ChartTitle(text: !isCardView ? 'Average sales per person' : ''),
//       plotAreaBorderWidth: 0,
//       primaryXAxis: DateTimeAxis(
//           interval: 1,
//           intervalType: DateTimeIntervalType.years,
//           dateFormat: DateFormat.y(),
//           majorGridLines: const MajorGridLines(width: 0),
//           edgeLabelPlacement: EdgeLabelPlacement.shift),
//       primaryYAxis: NumericAxis(
//           title: AxisTitle(text: !isCardView ? 'Revenue' : ''),
//           axisLine: const AxisLine(width: 0),
//           majorTickLines: const MajorTickLines(width: 0)),
//       series: _getDefaultTrackballSeries(),

//       /// To set the track ball as true and customized trackball behaviour.
//       trackballBehavior: TrackballBehavior(
//         enable: true,
//         markerSettings: TrackballMarkerSettings(
//           markerVisibility: _showMarker
//               ? TrackballVisibilityMode.visible
//               : TrackballVisibilityMode.hidden,
//           height: 10,
//           width: 10,
//           borderWidth: 1,
//         ),
//         hideDelay: duration * 1000,
//         activationMode: ActivationMode.singleTap,
//         tooltipAlignment: ChartAlignment.center,
//         tooltipDisplayMode:TrackballDisplayMode.groupAllPoints,
//         tooltipSettings: InteractiveTooltip(
//             format: _mode != TrackballDisplayMode.groupAllPoints
//                 ? 'series.name : point.y'
//                 : null,
//             canShowMarker: canShowMarker),
//         shouldAlwaysShow: showAlways,
//       ),
//     );
//   }

//   /// Returns the list of chart which need to render  on the cartesian chart.
//   List<LineSeries<ChartSampleData, DateTime>> _getDefaultTrackballSeries() {
//     return <LineSeries<ChartSampleData, DateTime>>[
//       LineSeries<ChartSampleData, DateTime>(
//           dataSource: chartData,
//           xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
//           yValueMapper: (ChartSampleData sales, _) => sales.y,
//           width: 2,
//           name: 'John',
//           markerSettings: const MarkerSettings(isVisible: true)),
//       LineSeries<ChartSampleData, DateTime>(
//           dataSource: chartData,
//           width: 2,
//           name: 'Andrew',
//           xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
//           yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
//           markerSettings: const MarkerSettings(isVisible: true)),
//       LineSeries<ChartSampleData, DateTime>(
//           dataSource: chartData,
//           width: 2,
//           xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
//           yValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
//           name: 'Thomas',
//           markerSettings: const MarkerSettings(isVisible: true))
//     ];
//   }

//   /// Method to update the trackball display mode in the chart on change.
//   void onModeTypeChange(String item) {
//     _selectedMode = item;
//     if (_selectedMode == 'floatAllPoints') {
//       _mode = TrackballDisplayMode.floatAllPoints;
//     }
//     if (_selectedMode == 'groupAllPoints') {
//       _mode = TrackballDisplayMode.groupAllPoints;
//     }
//     if (_selectedMode == 'nearestPoint') {
//       _mode = TrackballDisplayMode.nearestPoint;
//     }
//     if (_selectedMode == 'none') {
//       _mode = TrackballDisplayMode.none;
//     }
//     setState(() {
//       /// update the trackball display type changes
//     });
//   }

//   /// Method to update the chart alignment for tooltip in the chart on change.
//   void onAlignmentChange(String item) {
//     _tooltipAlignment = item;
//     if (_tooltipAlignment == 'center') {
//       _alignment = ChartAlignment.center;
//     }
//     if (_tooltipAlignment == 'far') {
//       _alignment = ChartAlignment.far;
//     }
//     if (_tooltipAlignment == 'near') {
//       _alignment = ChartAlignment.near;
//     }
//     setState(() {
//       /// update the tooltip alignment changes
//     });
//   }
// }

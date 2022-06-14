/// Package imports
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports

/// State class of the chart with custom zooming buttons.
class _ButtonZoomingState extends SampleViewState {
  _ButtonZoomingState();
  late ZoomPanBehavior _zoomPan;
  @override
  void initState() {
    _zoomPan = ZoomPanBehavior(
      enableDoubleTapZooming: true,
      enablePanning: true,
      enablePinching: true,
      enableSelectionZooming: true,
    );
    zoomData = <ChartSampleData>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: model.cardThemeColor,
        body: Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 5, isCardView ? 0 : 50),
          child: Container(child: _buildButtonZoomingChart()),
        ),
        floatingActionButton: isCardView
            ? null
            : SizedBox(
                child: Stack(children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 50,
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: model.isWebFullView ? null : (MediaQuery.of(context).size.width / 7) * 0.9,
                              padding: const EdgeInsets.fromLTRB(24, 15, 0, 0),
                              child: Tooltip(
                                message: 'Zoom In',
                                child: IconButton(
                                  icon: Icon(Icons.add, color: model.backgroundColor),
                                  onPressed: () {
                                    _zoomPan.zoomIn();
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: model.isWebFullView ? null : (MediaQuery.of(context).size.width / 7) * 0.9,
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Tooltip(
                                message: 'Zoom Out',
                                child: IconButton(
                                  icon: Icon(Icons.remove, color: model.backgroundColor),
                                  onPressed: () {
                                    _zoomPan.zoomOut();
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: model.isWebFullView ? null : (MediaQuery.of(context).size.width / 7) * 0.9,
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Tooltip(
                                message: 'Pan Up',
                                child: IconButton(
                                  icon: Icon(Icons.keyboard_arrow_up, color: model.backgroundColor),
                                  onPressed: () {
                                    _zoomPan.panToDirection('top');
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: model.isWebFullView ? null : (MediaQuery.of(context).size.width / 7) * 0.9,
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Tooltip(
                                message: 'Pan Down',
                                child: IconButton(
                                  icon: Icon(Icons.keyboard_arrow_down, color: model.backgroundColor),
                                  onPressed: () {
                                    _zoomPan.panToDirection('bottom');
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: model.isWebFullView ? null : (MediaQuery.of(context).size.width / 7) * 0.9,
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Tooltip(
                                message: 'Pan Left',
                                child: IconButton(
                                  icon: Icon(Icons.keyboard_arrow_left, color: model.backgroundColor),
                                  onPressed: () {
                                    _zoomPan.panToDirection('left');
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: model.isWebFullView ? null : (MediaQuery.of(context).size.width / 7) * 0.9,
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Tooltip(
                                message: 'Pan Right',
                                child: IconButton(
                                  icon: Icon(Icons.keyboard_arrow_right, color: model.backgroundColor),
                                  onPressed: () {
                                    _zoomPan.panToDirection('right');
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: model.isWebFullView ? null : (MediaQuery.of(context).size.width / 7) * 0.9,
                              padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                              child: Tooltip(
                                message: 'Reset',
                                child: IconButton(
                                  icon: Icon(Icons.refresh, color: model.backgroundColor),
                                  onPressed: () {
                                    _zoomPan.reset();
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ));
  }

  /// Returns the Cartesian chart with custom zooming buttons.
  SfCartesianChart _buildButtonZoomingChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(axisLine: const AxisLine(width: 0), majorTickLines: const MajorTickLines(size: 0)),
      series: getButtonZoomingSeries(isCardView),
      zoomPanBehavior: _zoomPan,
    );
  }
}

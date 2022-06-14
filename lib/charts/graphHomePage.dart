import 'package:dragAndDrop/main.dart';
import 'package:flutter/material.dart';
import '../data.dart';
import 'dart:core';
import "./combinedGraphs.dart";
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphHomePage extends StatefulWidget {
  final PandoraBox model;

  GraphHomePage({Key? key, required this.model}) : super(key: key);
  @override
  _GraphHomePageState createState() => _GraphHomePageState();
}

class _GraphHomePageState extends State<GraphHomePage> {
  int _currentPageIndex = 0;

  void _openPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/'),
        ),
        title: Text("Graphs"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CombinedChartPage(),
            ),
          ],
        ),
      ),
    );
  }
}

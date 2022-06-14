import 'package:dragAndDrop/main.dart';
import 'package:flutter/material.dart';
import '../data.dart';
import 'dart:core';

class GraphHomePage extends StatefulWidget {
  final PandoraBox model;
  // final List<Page> _pages = [
  //   Page("team1", Icons.person_outline),
  //   Page("team2", Icons.person_outline),
  // ];
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
        child: Text("HI"),
      ),
    );
  }
}

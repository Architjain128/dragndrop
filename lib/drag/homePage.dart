import 'package:dragAndDrop/main.dart';
import 'package:flutter/material.dart';
import './dataForNext.dart';
import './bowlingOrder.dart';
import '../data.dart';
import 'dart:core';

class MyHomePage extends StatefulWidget {
  final PandoraBox model;
  // final List<Page> _pages = [
  //   Page("team1", Icons.person_outline),
  //   Page("team2", Icons.person_outline),
  // ];
  MyHomePage({Key? key, required this.model}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;

  void _openPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Page> teams = [
      Page(widget.model.teamName1, Icons.person_outline),
      Page(widget.model.teamName2, Icons.person_outline),
      Page("Next", Icons.person_outline),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/'),
        ),
        title: Text("Bowling Order"),
      ),
      body: Center(
        child: _currentPageIndex == 2 ? DataForNextPage(model: widget.model) : BowlingOrderPage(model: widget.model, teamNumber: _currentPageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: teams
            .map((Page page) => BottomNavigationBarItem(
                  icon: Icon(page.iconData),
                  label: page.title,
                ))
            .toList(),
        onTap: _openPage,
      ),
    );
  }
}

class Page {
  final String title;
  final IconData iconData;
  Page(this.title, this.iconData);
}

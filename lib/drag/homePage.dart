import 'package:flutter/material.dart';
import './bowlingOrder.dart';
import '../data.dart';
import 'dart:core';

class MyHomePage extends StatefulWidget {
  final List<Page> _pages = [
    Page('Team1', Icons.person_outline),
    Page('Team2', Icons.person_outline),
  ];

  MyHomePage({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Bowling Order")),
      ),
      body: Center(
        child: BowlingOrderPage(teamName: NAME, allPlayers: TEAM1_SELECTED_PLAYERS),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        items: widget._pages
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

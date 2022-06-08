import 'package:dragAndDrop/main.dart';
import 'package:flutter/material.dart';
import './bowlingOrder.dart';
import '../data.dart';
import 'dart:core';

class MyHomePage extends StatefulWidget {
  final PandoraBox model;
  final List<Page> _pages = [
    Page("team1", Icons.person_outline),
    Page("team2", Icons.person_outline),
  ];

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

  Widget _choseTeam() {
    List<Page> teams = [
      Page(widget.model.teamName1, Icons.person_outline),
      Page(widget.model.teamName2, Icons.person_outline),
    ];
    return BottomNavigationBar(
      currentIndex: _currentPageIndex,
      items: teams
          .map((Page page) => BottomNavigationBarItem(
                icon: Icon(page.iconData),
                label: page.title,
              ))
          .toList(),
      onTap: _openPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Page> teams = [
      Page(widget.model.teamName1, Icons.person_outline),
      Page(widget.model.teamName2, Icons.person_outline),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.model.teamName1)),
        // title: Center(child: Text("Bowling Order")),
      ),
      body: Center(
        child: BowlingOrderPage(teamName: NAME, allPlayers: TEAM1_SELECTED_PLAYERS),
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

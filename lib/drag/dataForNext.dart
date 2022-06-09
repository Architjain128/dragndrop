import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import '../data.dart';
import '../main.dart';

class DataForNextPage extends StatefulWidget {
  PandoraBox model;

  DataForNextPage({Key? key, required this.model}) : super(key: key);

  @override
  _DataForNextPageState createState() => _DataForNextPageState();
}

class _DataForNextPageState extends State<DataForNextPage> {
  int zz = 0;
  String teamName1 = "";
  String teamName2 = "";
  List<int>? bowlingOrder1 = [];
  List<int>? bowlingOrder2 = [];
  @override
  Widget build(BuildContext context) {
    teamName1 = widget.model.teamName1;
    teamName2 = widget.model.teamName2;
    bowlingOrder1 = widget.model.bowlingOrder(teamName1);
    bowlingOrder2 = widget.model.bowlingOrder(teamName2);
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(teamName1),
                    Expanded(
                      child: ListView(
                        children: bowlingOrder1!.map((todo) => Text(todo.toString()) as Widget).toList(),
                      ),
                    ),
                    Divider(height: 2, color: Colors.black),
                    Text(teamName2),
                    Expanded(
                      child: Column(
                        children: bowlingOrder2!.map((todo) => Text(todo.toString()) as Widget).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

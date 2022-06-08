import 'package:dragAndDrop/data.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import './drag/homePage.dart';
import 'dart:convert';
import 'dart:core';
import '../data.dart';

void main() => runApp(MyApp(
      model: PandoraBox(),
    ));

class MyApp extends StatelessWidget {
  final PandoraBox model;
  const MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ScopedModel<PandoraBox>(
    //   model: model,
    //   child:
    return MaterialApp(
      title: 'sports',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      // ),
    );
  }
}

class PandoraBox extends Model {
  int _totalOvers = 20;
  String _teamName1 = TEAM_NAME1;
  String _teamName2 = TEAM_NAME2;
  Map<String, dynamic> _emptyPlayer = json.decode(json.encode(EMPTY_PLAYER));
  List<Object> _teamPlayers1 = TEAM1_SELECTED_PLAYERS;
  List<Object> _teamPlayers2 = TEAM2_SELECTED_PLAYERS;

  int get totalOvers => _totalOvers;
  String get teamName1 => _teamName1;
  String get teamName2 => _teamName2;
  Map<String, dynamic> get emptyPlayer => _emptyPlayer;
  List<Object> get teamPlayers1 => _teamPlayers1;
  List<Object> get teamPlayers2 => _teamPlayers2;

  Map<String, dynamic>? fromObject(Object data) {
    return json.decode(json.encode(data));
  }

  Map<String, dynamic>? getPlayerbyId(int id, String teamName) {
    if (teamName1 == teamName) {
      for (var player in _teamPlayers1) {
        Map<String, dynamic>? players = fromObject(player);
        if (players?["id"] == id) return players;
      }
      return _emptyPlayer;
    } else if (teamName2 == teamName) {
      for (var player in _teamPlayers2) {
        Map<String, dynamic>? players = fromObject(player);
        if (players?["id"] == id) return players;
      }
      return _emptyPlayer;
    } else {
      return _emptyPlayer;
    }
  }
}

import 'package:dragAndDrop/data.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';
import './drag/homePage.dart';
import 'dart:convert';
import 'dart:core';
import '../data.dart';

void main() => runApp(MyApp(model: PandoraBox()));

class MyApp extends StatelessWidget {
  final PandoraBox model;
  const MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<PandoraBox>(
      model: model,
      child: MaterialApp(
        title: 'sports',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: MyHomePage(),
        home: ScopedModelDescendant<PandoraBox>(
          builder: (context, child, model) {
            return MyHomePage(
              model: model,
            );
          },
        ),
      ),
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
  Map<int, int> _oversCompleted1 = {};
  Map<int, int> _oversCompleted2 = {};
  List<int> _bowlingOrder1 = List<int>.filled(TOTAL_OVERS, -1, growable: false);
  List<int> _bowlingOrder2 = List<int>.filled(TOTAL_OVERS, -1, growable: false);

  int get totalOvers => _totalOvers;
  String get teamName1 => _teamName1;
  String get teamName2 => _teamName2;
  Map<String, dynamic> get emptyPlayer => _emptyPlayer;
  List<Object> get teamPlayers1 => _teamPlayers1;
  List<Object> get teamPlayers2 => _teamPlayers2;

  List<int>? bowlingOrder(String teamName) {
    if (teamName1 == teamName) {
      return _bowlingOrder1;
    } else {
      return _bowlingOrder2;
    }
  }

  void updateBowlingOrder(int overNumbers, int id, String teamName) {
    if (teamName == _teamName1) {
      _bowlingOrder1[overNumbers - 1] = id;
    }
    if (teamName == _teamName2) {
      _bowlingOrder2[overNumbers - 1] = id;
    }
    notifyListeners();
  }

  void oversCompleted(int id, String teamName, int value) {
    if (_teamName1 == teamName) {
      if (_oversCompleted1.containsKey(id)) {
        _oversCompleted1[id] = _oversCompleted1[id]! + value;
      } else {
        _oversCompleted1[id] = 1;
      }
    }
    if (_teamName2 == teamName) {
      if (_oversCompleted2.containsKey(id)) {
        _oversCompleted2[id] = _oversCompleted2[id]! + value;
      } else {
        _oversCompleted2[id] = 1;
      }
    }
    notifyListeners();
  }

  int? getOversCompletedById(int id, String teamName) {
    int? value = 0;
    if (_teamName1 == teamName) {
      if (_oversCompleted1.containsKey(id)) {
        value = _oversCompleted1[id];
      }
    }
    if (_teamName2 == teamName) {
      if (_oversCompleted2.containsKey(id)) {
        value = _oversCompleted2[id];
      }
    }
    return value;
  }

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

  bool checkBoundaryConditions(int overNumber, int idx, String teamName) {
    bool value = true;
    if (_teamName1 == teamName) {
      if (overNumber == 1) {
        if (_bowlingOrder1[overNumber] == idx) {
          value = false;
        }
      } else if (overNumber == 20) {
        if (_bowlingOrder1[overNumber - 2] == idx) {
          value = false;
        }
      } else {
        if (_bowlingOrder1[overNumber] == idx || _bowlingOrder1[overNumber - 2] == idx) {
          value = false;
        }
      }
    }
    if (_teamName2 == teamName) {
      if (overNumber == 1) {
        if (_bowlingOrder2[overNumber] == idx) {
          value = false;
        }
      } else if (overNumber == 20) {
        if (_bowlingOrder2[overNumber - 2] == idx) {
          value = false;
        }
      } else {
        if (_bowlingOrder2[overNumber] == idx && _bowlingOrder2[overNumber - 2] == idx) {
          value = false;
        }
      }
    }
    if (value == false) {
      print("No consequtive overs allowed.");
      return value;
    }

    if (teamName == _teamName1) {
      if (_oversCompleted1[idx] == 4) {
        value = false;
      }
    }
    if (teamName == _teamName2) {
      if (_oversCompleted2[idx] == 4) {
        value = false;
      }
    }
    if (value == false) {
      print("Max limit of 4 overs reached.");
    }
    return value;
  }

  void freeOver(int overNumber, int id, String teamName) {
    updateBowlingOrder(overNumber, -1, teamName);
    oversCompleted(id, teamName, -1);
    notifyListeners();
  }

  bool isPossibleBowlingOrder(List<int> overs) {
    for (int i = 1; i < 20; i++) {
      if (overs[i] == overs[i - 1] && overs[i] != -1) {
        return false;
      }
    }
    return true;
  }

  void afterReordering(int oldId, int newId, String teamName) {
    List<int> _newBowlingOrder = List<int>.filled(TOTAL_OVERS, 0, growable: false);
    List<int> _curBowlingOrder = teamName == _teamName1 ? _bowlingOrder1 : _bowlingOrder2;
    if (oldId < newId) {
      newId -= 1; //goes down
      for (int i = 0; i < oldId; i++) {
        _newBowlingOrder[i] = _curBowlingOrder[i];
      }
      int val = _curBowlingOrder[oldId];
      for (int i = oldId; i < newId; i++) {
        _newBowlingOrder[i] = _curBowlingOrder[i + 1];
      }
      _newBowlingOrder[newId] = val;
      for (int i = newId + 1; i < 20; i++) {
        _newBowlingOrder[i] = _curBowlingOrder[i];
      }
    } else if (oldId > newId) {
      // goes up
      int val = _curBowlingOrder[oldId];
      for (int i = 0; i < newId; i++) {
        _newBowlingOrder[i] = _curBowlingOrder[i];
      }
      for (int i = oldId; i > newId; i--) {
        _newBowlingOrder[i] = _curBowlingOrder[i - 1];
      }
      _newBowlingOrder[newId] = val;
      for (int i = oldId + 1; i < 20; i++) {
        _newBowlingOrder[i] = _curBowlingOrder[i];
      }
    } else {
      for (int i = 0; i < 20; i++) {
        _newBowlingOrder[i] = _curBowlingOrder[i];
      }
    }
    if (isPossibleBowlingOrder(_newBowlingOrder)) {
      if (teamName == _teamName1) {
        _bowlingOrder1 = _newBowlingOrder;
      } else {
        _bowlingOrder2 = _newBowlingOrder;
      }
    }
    notifyListeners();
  }
}

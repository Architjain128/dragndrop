import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import '../data.dart';
import '../main.dart';

class BowlingOrderPage extends StatefulWidget {
  PandoraBox model;
  int? teamNumber;
  String? teamName;
  List<Object>? allPlayers = [];

  BowlingOrderPage({Key? key, required this.model, this.teamNumber}) : super(key: key);

  @override
  _BowlingOrderPageState createState() => _BowlingOrderPageState();
}

class _BowlingOrderPageState extends State<BowlingOrderPage> {
  int zz = 0;
  String teamName = "";
  List<Object>? allPlayers = [];
  // List<int>? bowlingList = [];
  // Map<int, int> oversCompleted = {};

  @override
  Widget build(BuildContext context) {
    teamName = widget.teamNumber == 0 ? widget.model.teamName1 : widget.model.teamName2;
    allPlayers = widget.teamNumber == 0 ? widget.model.teamPlayers1 : widget.model.teamPlayers2;
    // bowlingList = widget.model.bowlingOrder(teamName);

    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _reorderableWrapper(),
                //     child: ListView(
                //   padding: const EdgeInsets.all(8),
                //   children: _listOfAllOvers(),
                // ),
              ),
              _allPlayersComponenet(),
            ],
          ),
        ),
      ],
    );
  }

  void _onDrag(BuildContext context, DragUpdateDetails update, int overNumber, int idx) {
    if (update.localPosition.dx.abs() > 20) {
      widget.model.freeOver(overNumber, idx, teamName);
      return;
    }
  }

  Widget _reorderableWrapper() {
    return ReorderableListView(
      // padding: const EdgeInsets.symmetric(horizontal: 40),
      padding: EdgeInsets.all(10),
      children: _listOfAllOvers(),
      onReorder: (int oldIndex, int newIndex) {
        print(oldIndex);
        print(newIndex);
      },
    );
  }

  Widget _oversBowled(int overNumber, int idx) {
    Map<String, dynamic>? player = widget.model.getPlayerbyId(idx, teamName);
    return Card(
      elevation: 5,
      color: Colors.black12,
      child: GestureDetector(
        onDoubleTap: () {
          widget.model.freeOver(overNumber, idx, teamName);
        },
        onHorizontalDragUpdate: (DragUpdateDetails update) => _onDrag(context, update, overNumber, idx),
        child: ListTile(
          onTap: () {
            // widget.model.freeOver(overNumber, idx, teamName);
          },
          title: Text(player?["name"]),
          subtitle: Text(player?["sport_specific_keys"]["bowling"]["style"]),
          leading: CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/200")),
          trailing: Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.sports_cricket_outlined),
          ),
        ),
      ),
    );
  }

  Widget _oversBowledEmpty(int overNumber) {
    return Card(
      // key: Key((overNumber - 1).toString()),
      child: ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.only(right: 10),
        title: Text("Select Bowler"),
        subtitle: Text("Drag from below listed bowlers"),
        leading: CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/200")),
        trailing: Icon(Icons.sports_cricket_outlined),
      ),
    );
  }

  Widget _oversBowledWrapper(int overNumber, int idx) {
    Map<String, dynamic>? player = widget.model.getPlayerbyId(idx, teamName);

    return DragTarget(
        key: Key((overNumber - 1).toString()),
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
              key: Key((overNumber - 1).toString()),
              child: Stack(
                children: [
                  idx == -1 ? _oversBowledEmpty(overNumber) : _oversBowled(overNumber, idx),
                  Container(
                    height: 30,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      overNumber.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
              // child: Center(
              //   child: idx == -1 ? _oversBowledEmpty(overNumber) : _oversBowled(overNumber, idx),
              // ),
              );
        },
        onAccept: (int data) {
          if (widget.model.checkBoundaryConditions(overNumber, data, teamName)) {
            print(data);
            idx = data;
            // print(widget.model.bowlingOrder(teamName));
            widget.model.updateBowlingOrder(overNumber, data, teamName);
            widget.model.oversCompleted(data, teamName, 1);
            // print(widget.model.bowlingOrder(teamName));
          }
        });
  }

  List<Widget> _listOfAllOvers() {
    List<Widget> data = [];
    int overNumber = 1;
    for (var idx in widget.model.bowlingOrder(teamName) ?? []) {
      data.add(_oversBowledWrapper(overNumber, idx));
      overNumber += 1;
    }
    return data;
  }

  Widget _DragablePlayerWrapper(Object data) {
    Map<String, dynamic>? PlayerData = widget.model.fromObject(data);
    return Draggable<Object>(
      maxSimultaneousDrags: widget.model.getOversCompletedById(PlayerData?["id"], teamName) == 4 ? 0 : 1,
      data: PlayerData?["id"],
      feedback: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          PlayerData?["name"],
          style: TextStyle(
            decoration: TextDecoration.none,
            backgroundColor: Colors.black,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      child: _DragablePlayer(PlayerData),
    );
  }

  Widget _DragablePlayer(Map<String, dynamic>? PlayerData) {
    // Map<String, dynamic>? PlayerData = json.decode(json.encode(data));
    PlayerData?["oversCompleted"] = 0;
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: widget.model.getOversCompletedById(PlayerData?["id"], teamName) == 4 ? Colors.grey : Colors.white,
        border: Border.all(color: Color.fromRGBO(0, 0, 0, 1), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 35,
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent[100],
              radius: 30,
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://picsum.photos/200"), //NetworkImage
                radius: 25,
              ), //CircleAvatar
            ), //CircleAvatar
          ),
          Column(children: [
            Row(
              children: [
                // PlayerData?["additional_skill"] != null ? Text(PlayerData?["additional_skill"]) : Text(" "),
                Text(PlayerData?["name"]),
                PlayerData?["nationality"] == "Overseas" ? Text(" ✈️") : Text(""),
              ],
            ),
            Row(
              children: [
                PlayerData?["sport_specific_keys"] != null || PlayerData?["sport_specific_keys"]?["bowling"] != null || PlayerData?["sport_specific_keys"]?["bowling"]?["style"] != null ? Text(PlayerData?["sport_specific_keys"]?["bowling"]?["style"]) : Text(" "),
                Text(" 🏏"),
              ],
            )
          ]),
          VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
          Column(
            children: [
              Text("Overs"),
              Text(widget.model.getOversCompletedById(PlayerData?["id"], teamName).toString()),
              // Text(oversCompleted[PlayerData?["id"]].toString()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _allPlayersComponenet() {
    List<Widget> data = <Widget>[];
    if (allPlayers != null) {
      for (var p in allPlayers ?? []) {
        data.add(_DragablePlayerWrapper(p));
      }
    } else {
      data.add(Container(child: Text("none")));
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.black),
          bottom: BorderSide(width: 1.0, color: Colors.black),
        ),
      ),
      child: ListView(scrollDirection: Axis.horizontal, children: data),
      // )
    );
  }
}

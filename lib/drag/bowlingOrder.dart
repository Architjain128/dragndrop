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
  List<int> bowlingList = [];

  @override
  Widget build(BuildContext context) {
    teamName = widget.teamNumber == 0 ? widget.model.teamName1 : widget.model.teamName2;
    allPlayers = widget.teamNumber == 0 ? widget.model.teamPlayers1 : widget.model.teamPlayers2;
    bowlingList = List<int>.filled(widget.model.totalOvers, -1, growable: false);
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              // _OversToBeBowled(),
              Expanded(
                  child: ListView(
                padding: const EdgeInsets.all(8),
                children: _listOfAllOvers(),
              )),
              _allPlayersComponenet(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _oversBowled(Object? data) {
    Map<String, dynamic> player = json.decode(json.encode(data));
    return Container(
      child: Text(player["id"].toString()),
    );
  }

  Widget _oversBowledEmpty(int overNumber) {
    // Map<String, dynamic> player = json.decode(json.encode(data));
    return Card(
        child: Stack(children: [
      Container(child: Text(overNumber.toString())),
      VerticalDivider(width: 2.0, color: Colors.black),
      ListTile(
        onTap: () {},
        title: Text("Select Bowler"),
        subtitle: Text("Drag from below listed bowlers"),
        leading: CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/200")),
        trailing: Icon(Icons.sports_cricket_outlined),
      )
    ]));
  }

  Widget _OversToBeBowled() {
    Object? acceptedData = EMPTY_PLAYER;
    Map<String, dynamic> player = json.decode(json.encode(EMPTY_PLAYER));
    print(acceptedData);
    return DragTarget(builder: (
      BuildContext context,
      List<dynamic> accepted,
      List<dynamic> rejected,
    ) {
      return Container(
        color: Colors.cyan,
        child: Center(
          child: _oversBowled(acceptedData),
        ),
      );
    }, onAccept: (Object data) {
      if (data != null) {
        print(data);
        acceptedData = data;
      }
    });
  }

  List<Widget> _listOfAllOvers() {
    List<Widget> data = [];
    int overNumber = 1;
    for (var idx in bowlingList) {
      if (idx == -1)
        data.add(_oversBowledEmpty(overNumber));
      else
        data.add(_oversBowled(widget.model.getPlayerbyId(idx, teamName)));
      overNumber += 1;
    }
    return data;
  }

  Widget _DragablePlayerWrapper(Object data) {
    Map<String, dynamic>? PlayerData = json.decode(json.encode(data));
    return Draggable<Object>(
      data: data,
      feedback: Text("feedback"),
      child: _DragablePlayer(data),
    );
  }

  Widget _DragablePlayer(Object data) {
    Map<String, dynamic>? PlayerData = json.decode(json.encode(data));
    return Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
        decoration: BoxDecoration(
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
                Text("0"),
              ],
            )
          ],
        ));
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
    // return Positioned(
    //     bottom: 0,
    //     child:
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(width: 1.0, color: Colors.black),
          bottom: BorderSide(width: 1.0, color: Colors.black),
        )),
        child: ListView(scrollDirection: Axis.horizontal, children: data)
        // )
        );
  }
}

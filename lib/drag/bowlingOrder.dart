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
  Widget _oversBowled(Object? data) {
    Map<String, dynamic> player = json.decode(json.encode(data));
    return Container(
      child: Text('$player'),
    );
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

  // List<Widget> _listOfAllOvers{

  // }

  Widget _DragablePlayerWrapper(Object data) {
    Map<String, dynamic>? PlayerData = json.decode(json.encode(data));
    return Draggable<Object>(data: data, feedback: Text("feedback"), child: _DragablePlayer(data));
  }

  // Draggable<int>(
  //         // Data is the value this Draggable stores.
  //         data: 10,
  //         feedback: Container(
  //           color: Colors.deepOrange,
  //           height: 100,
  //           width: 100,
  //           child: const Icon(Icons.directions_run),
  //         ),
  //         childWhenDragging: Container(
  //           height: 100.0,
  //           width: 100.0,
  //           color: Colors.pinkAccent,
  //           child: const Center(
  //             child: Text('Child When Dragging'),
  //           ),
  //         ),
  //         child: Container(
  //           height: 100.0,
  //           width: 100.0,
  //           color: Colors.lightGreenAccent,
  //           child: const Center(
  //             child: Text('Draggable'),
  //           ),
  //         ),
  //       ),
  //       DragTarget<int>(
  //         builder: (
  //           BuildContext context,
  //           List<dynamic> accepted,
  //           List<dynamic> rejected,
  //         ) {
  //           return Container(
  //             height: 100.0,
  //             width: 100.0,
  //             color: Colors.cyan,
  //             child: Center(
  //               child: Text('Value is updated to: $acceptedData'),
  //             ),
  //           );
  //         },
  //         onAccept: (int data) {
  //           setState(() {
  //             acceptedData += data;
  //           });
  //         },
  //       ),

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
    print(zz);
    List<Widget> data = <Widget>[];
    if (widget.allPlayers != null) {
      for (var p in widget.allPlayers ?? []) {
        data.add(_DragablePlayerWrapper(p));
      }
    } else {
      data.add(Container(child: Text("none")));
    }
    return Positioned(
        bottom: 0,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 1.0, color: Colors.black),
              bottom: BorderSide(width: 1.0, color: Colors.black),
            )),
            child: ListView(scrollDirection: Axis.horizontal, children: data)));
  }

  @override
  Widget build(BuildContext context) {
    int zz = 1;
    // return Stack(
    //   children: [
    //     SafeArea(
    //       child: Column(
    //         children: [
    //           Expanded(
    //             child: _OversToBeBowled(),
    //           ),
    //           _allPlayersComponenet(),
    //         ],
    //       ),
    //     ),
    //   ],
    // );

    return Container(
        child: Stack(children: <Widget>[
      _OversToBeBowled(),
      _allPlayersComponenet(),
    ]));
  }
}

// class Player {
//   final int id;
//   final String skill_name;
//   final String nationality;
//   final String additional_skills;
//   final PlayerSpecifcs sport_specific_keys;
//   final String name;
//   final bool chosen;
//   final bool selected;
//   Player(this.id, this.skill_name, this.nationality, this.additional_skills, this.sport_specific_keys, this.name, this.chosen, this.selected);
// }

// class PlayerSpecifcs {
//   final String additional_skill;
//   final int is_caption;
//   final PlayerStyle batting;
//   final PlayerStyle bowling;
//   PlayerSpecifcs(this.additional_skill, this.is_caption, this.batting, this.bowling);
// }

// class PlayerStyle {
//   final String style;
//   PlayerStyle(this.style);
// }

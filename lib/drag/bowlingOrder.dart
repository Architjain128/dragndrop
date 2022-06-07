import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';

class BowlingOrderPage extends StatefulWidget {
  String? teamName;
  List<Object>? allPlayers = [];
  BowlingOrderPage({Key? key, this.teamName, this.allPlayers}) : super(key: key);

  @override
  _BowlingOrderPageState createState() => _BowlingOrderPageState();
}

List<String> todos = [
  "a",
  "b",
  "a",
  "b",
  "a",
  "b",
  "a",
  "b",
  "a",
  "b",
  "a",
  "b",
  "a",
  "b",
  "a",
  "b"
];

class _BowlingOrderPageState extends State<BowlingOrderPage> {
  Widget _DragablePlayer(Object data) {
    Map<String, dynamic>? PlayerData = json.decode(json.encode(data));

    print(PlayerData?["sport_specific_keys"]?["bowling"]?["style"]);
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
                  backgroundImage: NetworkImage("https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
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
              PlayerData?["sport_specific_keys"] != null || PlayerData?["sport_specific_keys"]?["bowling"] != null || PlayerData?["sport_specific_keys"]?["bowling"]?["style"] != null ? Text(PlayerData?["sport_specific_keys"]?["bowling"?["style"]]) : Text(" "),
            ])
          ],
        ));
  }

  Widget _allPlayersComponenet() {
    List<Widget> data = <Widget>[];
    if (widget.allPlayers != null) {
      for (var p in widget.allPlayers ?? []) {
        data.add(_DragablePlayer(p));
      }
    } else {
      data.add(Container(child: Text("none")));
    }
    return Positioned(bottom: 0, child: Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height * 0.15, decoration: BoxDecoration(color: Colors.cyanAccent), child: ListView(scrollDirection: Axis.horizontal, children: data)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: <Widget>[
      new ListView(
        children: todos.map((todo) => new ListTile(title: new Text(todo))).toList(),
      ),
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

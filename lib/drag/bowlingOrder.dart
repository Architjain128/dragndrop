import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';

class BowlingOrderPage extends StatefulWidget {
  String? teamName;
  List<Object>? allPlayers;
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
  Widget _DragablePlayer(String name) {
    return Container(child: Text(name));
  }

  // Widget _listAllPlayers(){
  //   if(widget.allPlayers!=null){
  //     return widget.allPlayers.map((e) => new _DragablePlayer(e.name));
  //   }
  //   else{
  //     return _DragablePlayer("NAM");
  //   }
  // }
  Widget _allPlayersComponenet() {
    List<Widget> data = [];
    List<Object>? players = [];
    if (widget.allPlayers != null) {
      players = widget.allPlayers;
    }
    print(players);

    // if(widget.allPlayers!=null){
    //   widget.allPlayers.map((e)=>(data.add(_DragablePlayer("1"))));
    // }
    // else{
    //   data.add(_DragablePlayer("None"));
    // }
    return Positioned(
        bottom: 3.0,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Container(
            decoration: new BoxDecoration(color: Colors.cyanAccent),
            child: new ListView(scrollDirection: Axis.horizontal, children: data
                // <Widget>[
                // _DragablePlayer("archit")
                // widget.allPlayers!=null ? widget.allPlayers.map((e) => _DragablePlayer(e.name))??_DragablePlayer("NAM")
                // _listAllPlayers()
                // ]
                )));
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

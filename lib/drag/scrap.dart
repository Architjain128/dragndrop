Widget build(BuildContext context) {
  return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card(child: ListTile(onTap: () {}, title: Text(titles[index]), subtitle: Text(subtitles[index]), leading: CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/200")), trailing: Icons.ac_unit));
      });
}
// sports_cricket_outlined

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
//
//
//
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

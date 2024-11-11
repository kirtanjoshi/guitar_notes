// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:guitar_notes/chords_note_screen.dart';
// import 'package:guitar_notes/controller.dart';
//
// class LyricsNoteScreen extends StatefulWidget {
//   const LyricsNoteScreen({super.key});
//
//   @override
//   State<LyricsNoteScreen> createState() => _LyricsNoteScreenState();
// }
//
// class _LyricsNoteScreenState extends State<LyricsNoteScreen> {
//   final _controller = Get.put(LyricController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lyrics"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             TextField(
//               maxLines: 5,
//               controller: _controller.lyricController,
//               decoration: InputDecoration(
//                 labelText: "Enter lyric",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => ChordsNoteScreen()));
//       }),
//     );
//   }
// }

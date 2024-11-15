// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:guitar_notes/fasdfsadf.dart';
// // import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
// //
// // // // class SaveScreen extends StatefulWidget {
// // // //   const SaveScreen({super.key});
// // // //
// // // //   @override
// // // //   State<SaveScreen> createState() => _SaveScreenState();
// // // // }
// // // //
// // // // class _SaveScreenState extends State<SaveScreen> {
// // // //   final _controller = Get.find<LyricsController>();
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.red,
// // // //       body: Obx(() => Column(
// // // //             children: [
// // // //               Expanded(
// // // //                 child: SavedEntriesList(savedEntries: _controller.savedEntries),
// // // //               ),
// // // //             ],
// // // //           )),
// // // //     );
// // // //   }
// // // // }
// // //
// // // class SaveScreen extends StatefulWidget {
// // //   const SaveScreen({super.key});
// // //
// // //   @override
// // //   State<SaveScreen> createState() => _SaveScreenState();
// // // }
// // //
// // // class _SaveScreenState extends State<SaveScreen> {
// // //   // final _controller = Get.find<LyricsController>();
// // //   final _controller = Get.put(LyricsController());
// // //
// // //   // @override
// // //   // void print() {
// // //   //   // TODO: implement deactivate
// // //   //   print(_controller.savedEntries.toString())
// // //   // }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.red,
// // //       body: Obx(() {
// // //         if (_controller.savedEntries.isEmpty) {
// // //           return Center(
// // //             child: Text(
// // //               "No saved entries",
// // //               style: TextStyle(color: Colors.white, fontSize: 16),
// // //             ),
// // //           );
// // //         }
// // //         return Expanded(
// // //             child: SavedEntriesList(savedEntries: _controller.savedEntries));
// // //       }),
// // //     );
// // //   }
// // // }
// //
// // class SaveScreen extends StatefulWidget {
// //   const SaveScreen({super.key});
// //
// //   @override
// //   State<SaveScreen> createState() => _SaveScreenState();
// // }
// //
// // class _SaveScreenState extends State<SaveScreen> {
// //   final _controller = Get.find<LyricsController>();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.red,
// //       body: Obx(() {
// //         if (_controller.savedEntries.isEmpty) {
// //           return Center(
// //             child: Text(
// //               "No saved entries",
// //               style: TextStyle(color: Colors.white, fontSize: 16),
// //             ),
// //           );
// //         }
// //         return SavedEntriesList(savedEntries: _controller.savedEntries);
// //       }),
// //     );
// //   }
// // }
//
// // saved_lyrics_page.dart
// import 'package:flutter/material.dart';
//
// class SavedLyricsPage extends StatelessWidget {
//   final List<Map<String, dynamic>> savedEntries;
//
//   SavedLyricsPage({required this.savedEntries});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Saved Lyrics'),
//       ),
//       body: ListView.builder(
//         itemCount: savedEntries.length,
//         itemBuilder: (context, index) {
//           final entry = savedEntries[index];
//           final lyrics = entry['lyrics'] as String;
//           final chords = entry['chords'] as Map<int, Map<int, String>>;
//
//           return Card(
//             margin: EdgeInsets.symmetric(vertical: 5),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Saved Lyrics:',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 5),
//                   // Process each line in lyrics
//                   for (int lineIndex = 0;
//                       lineIndex < lyrics.split('\n').length;
//                       lineIndex++)
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Wrap(
//                           spacing: 2,
//                           children: List.generate(
//                             lyrics.split('\n')[lineIndex].split(' ').length,
//                             (wordIndex) {
//                               final word = lyrics
//                                   .split('\n')[lineIndex]
//                                   .split(' ')[wordIndex];
//                               final chord = chords[lineIndex]?[wordIndex] ?? '';
//
//                               return Column(
//                                 children: [
//                                   if (chord.isNotEmpty)
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 5, vertical: 3),
//                                       decoration: BoxDecoration(
//                                         color: Colors
//                                             .yellow, // Adjust color as needed
//                                         borderRadius: BorderRadius.circular(4),
//                                       ),
//                                       child: Text(
//                                         chord,
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   const SizedBox(height: 3),
//                                   Text(
//                                     '$word ',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/chords%20edit/widgets/save_entities.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';

class SavedEntriesPage extends StatelessWidget {
  final LyricsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Entries'),
      ),
      body: Obx(
        () => _controller.savedEntries.isEmpty
            ? Center(child: Text('No saved entries yet!'))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SavedEntriesList(savedEntries: _controller.savedEntries),
              ),
      ),
    );
  }
}

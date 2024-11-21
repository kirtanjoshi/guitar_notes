// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:guitar_notes/clone2/lyric_controller.dart';
// // import 'package:guitar_notes/clone2/shared_preference.dart';
// // import 'package:guitar_notes/global/constants/app_color.dart';
// //
// // class SavedEntriesList extends StatefulWidget {
// //   @override
// //   _SavedEntriesListState createState() => _SavedEntriesListState();
// // }
// //
// // class _SavedEntriesListState extends State<SavedEntriesList> {
// //   final SPStorage _storage = SPStorage();
// //
// //   final _controller = Get.find<LyricsController>();
// //
// //   // List<Map<String, dynamic>> savedEntries = [];
// //   //
// //   // @override
// //   // void initState() {
// //   //   super.initState();
// //   //   _controller.loadSavedEntries();
// //   // }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         actions: [
// //           IconButton(
// //               onPressed: () {
// //                 Navigator.of(context).pushNamed("/homeScreen");
// //               },
// //               icon: Icon(Icons.airplane_ticket))
// //         ],
// //       ),
// //       body: Obx(() {
// //         return ListView.builder(
// //           itemCount: _controller.entries.length,
// //           itemBuilder: (context, index) {
// //             final entry = _controller.entries[index];
// //             final lyrics = entry['lyrics'] as String;
// //             final chords = entry['chords'] as Map<String, Map<String, String>>;
// //
// //             return Card(
// //               color: AppColor.backgroundColor,
// //               margin: EdgeInsets.symmetric(vertical: 5),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       'Saved Lyrics:',
// //                       style: TextStyle(
// //                           fontWeight: FontWeight.bold, color: Colors.white),
// //                     ),
// //                     const SizedBox(height: 5),
// //
// //                     // Loop through each line of lyrics
// //                     for (int lineIndex = 0;
// //                         lineIndex < lyrics.split('\n').length;
// //                         lineIndex++)
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           // Display chords above the corresponding words
// //                           Wrap(
// //                             children: [
// //                               for (int wordIndex = 0;
// //                                   wordIndex <
// //                                       lyrics
// //                                           .split('\n')[lineIndex]
// //                                           .split(' ')
// //                                           .length;
// //                                   wordIndex++)
// //                                 Column(
// //                                   children: [
// //                                     // Display chord if exists
// //                                     Container(
// //                                       width: chords[lineIndex]?[wordIndex] !=
// //                                                   null &&
// //                                               chords[lineIndex]?[wordIndex]
// //                                                       ?.isNotEmpty ==
// //                                                   true
// //                                           ? 50
// //                                           : 0,
// //                                       padding: EdgeInsets.symmetric(
// //                                           horizontal: 5, vertical: 10),
// //                                       decoration: BoxDecoration(
// //                                           color: AppColor.secondaryColor,
// //                                           borderRadius:
// //                                               BorderRadius.circular(10)),
// //                                       child: Center(
// //                                         child: Text(
// //                                           chords[lineIndex]?[wordIndex] ?? '',
// //                                           style: TextStyle(
// //                                             color: Colors.black,
// //                                             fontWeight: FontWeight.bold,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     // Display the corresponding word with a space after it
// //                                     Text(
// //                                       lyrics
// //                                               .split('\n')[lineIndex]
// //                                               .split(' ')[wordIndex] +
// //                                           ' ',
// //                                       style: TextStyle(
// //                                         fontSize: 20,
// //                                         color: Colors.white,
// //                                         fontWeight: FontWeight.w500,
// //                                         fontFamily: "Inconsolata",
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                             ],
// //                           ),
// //                           const SizedBox(height: 10),
// //                         ],
// //                       ),
// //                   ],
// //                 ),
// //               ),
// //             );
// //           },
// //         );
// //       }),
// //     );
// //   }
// // }
// //
// // /// Code without local storage
// // // import 'package:flutter/material.dart';
// // // import 'package:guitar_notes/global/constants/app_color.dart';
// // // //
// // //
// // // class SavedEntriesList extends StatefulWidget {
// // //   @override
// // //   State<SavedEntriesList> createState() => _SavedEntriesListState();
// // // }
// // //
// // // class _SavedEntriesListState extends State<SavedEntriesList> {
// // //   List<Map<String, dynamic>> savedEntries = [];
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     loadSavedEntries();
// // //   }
// // //
// // //   // Load saved entries from SharedPreferences
// // //   void loadSavedEntries() async {
// // //     List<Map<String, dynamic>>? data =
// // //         await _storage.fetchAllData('chords_and_lyrics');
// // //     if (data != null) {
// // //       setState(() {
// // //         savedEntries = data;
// // //       });
// // //     }
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return ListView.builder(
// // //       itemCount: widget.savedEntries.length,
// // //       itemBuilder: (context, index) {
// // //         final entry = widget.savedEntries[index];
// // //         final lyrics = entry['lyrics'] as String;
// // //         final chords = entry['chords'] as Map<int, Map<int, String>>;
// // //
// // //         return Card(
// // //           color: AppColor.backgroundColor,
// // //           margin: EdgeInsets.symmetric(vertical: 5),
// // //           child: Padding(
// // //             padding: const EdgeInsets.all(8.0),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(
// // //                   'Saved Lyrics:',
// // //                   style: TextStyle(
// // //                       fontWeight: FontWeight.bold, color: Colors.white),
// // //                 ),
// // //                 const SizedBox(height: 5),
// // //
// // //                 // Loop through each line of lyrics
// // //                 for (int lineIndex = 0;
// // //                     lineIndex < lyrics.split('\n').length;
// // //                     lineIndex++)
// // //                   Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       // Display chords above the corresponding words
// // //                       Wrap(
// // //                         children: [
// // //                           for (int wordIndex = 0;
// // //                               wordIndex <
// // //                                   lyrics
// // //                                       .split('\n')[lineIndex]
// // //                                       .split(' ')
// // //                                       .length;
// // //                               wordIndex++)
// // //                             Column(
// // //                               children: [
// // //                                 // Display chord if exists
// // //
// // //                                 Container(
// // //                                   width:
// // //                                       chords[lineIndex]?[wordIndex] != null &&
// // //                                               chords[lineIndex]?[wordIndex]
// // //                                                       ?.isNotEmpty ==
// // //                                                   true
// // //                                           ? 50
// // //                                           : 0,
// // //                                   padding: EdgeInsets.symmetric(
// // //                                       horizontal: 5, vertical: 10),
// // //                                   decoration: BoxDecoration(
// // //                                       color: AppColor.secondaryColor,
// // //                                       borderRadius: BorderRadius.circular(10)),
// // //                                   child: Center(
// // //                                     child: Text(
// // //                                       chords[lineIndex]?[wordIndex] ?? '',
// // //                                       style: TextStyle(
// // //                                         color: Colors.black,
// // //                                         fontWeight: FontWeight.bold,
// // //                                       ),
// // //                                     ),
// // //                                   ),
// // //                                 ),
// // //                                 // SizedBox(height: 5),
// // //                                 // Display the corresponding word with a space after it
// // //                                 Text(
// // //                                   lyrics
// // //                                           .split('\n')[lineIndex]
// // //                                           .split(' ')[wordIndex] +
// // //                                       ' ',
// // //                                   style: TextStyle(
// // //                                     fontSize: 20,
// // //                                     color: Colors.white,
// // //                                     fontWeight: FontWeight.w500,
// // //                                     fontFamily: "Inconsolata",
// // //                                   ),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                         ],
// // //                       ),
// // //                       const SizedBox(height: 10),
// // //                     ],
// // //                   ),
// // //               ],
// // //             ),
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // // }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SavedEntriesList extends StatelessWidget {
//   final List<Map<String, dynamic>>
// //       savedEntries; // Ensure this is a list of maps
//   @override
//   Widget build(BuildContext context) {
//     // Get the passed arguments
//     final songDetails = Get.arguments as Map<String, dynamic>;
//
//     final title = songDetails['title'];
//     final artist = songDetails['artist'];
//     final capo = songDetails['capo'];
//     final strumming = songDetails['strumming'];
//     final lyrics = songDetails['lyrics'] as String;
//     final chords = songDetails['chords'] as Map<int, Map<int, String>>;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Song Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Title: $title', style: TextStyle(fontSize: 24)),
//               SizedBox(height: 10),
//               Text('Artist: $artist', style: TextStyle(fontSize: 18)),
//               SizedBox(height: 10),
//               Text('Capo: $capo', style: TextStyle(fontSize: 18)),
//               SizedBox(height: 10),
//               Text('Strumming: $strumming', style: TextStyle(fontSize: 18)),
//               SizedBox(height: 20),
//               Text('Lyrics:', style: TextStyle(fontSize: 22)),
//               SizedBox(height: 10),
//               for (int lineIndex = 0;
//                   lineIndex < lyrics.split('\n').length;
//                   lineIndex++)
//                 Wrap(
//                   children: [
//                     for (int wordIndex = 0;
//                         wordIndex <
//                             lyrics.split('\n')[lineIndex].split(' ').length;
//                         wordIndex++)
//                       Column(
//                         children: [
//                           // Display chord if exists
//                           if (chords[lineIndex.toString()] != null &&
//                               chords[lineIndex.toString()]![
//                                       wordIndex.toString()] !=
//                                   null)
//                             Text(
//                               chords[lineIndex.toString()]![
//                                   wordIndex.toString()]!,
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           Text(
//                             lyrics.split('\n')[lineIndex].split(' ')[wordIndex],
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

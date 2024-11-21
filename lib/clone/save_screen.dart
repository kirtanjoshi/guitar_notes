// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:guitar_notes/clone/controller.dart';
// import 'package:guitar_notes/global/constants/app_color.dart';
//
// class SavedEntriesPage extends StatelessWidget {
//   final LyricsController _controller = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     // Load saved entries when the page is built
//     _controller.loadAllLyrics();
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColor.backgroundColor,
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             margin: EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Title Section
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Saved Entries",
//                       style: TextStyle(
//                         color: AppColor.primaryColor,
//                         fontFamily: "Cousine",
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25.sp,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//
//                 // Single Card for All Lyrics
//                 Expanded(
//                   child: Obx(() {
//                     if (_controller.savedEntries.isEmpty) {
//                       return Center(
//                         child: Text(
//                           'No saved entries yet!',
//                           style: TextStyle(
//                             fontSize: 18.sp,
//                             color: AppColor.secondaryColor,
//                           ),
//                         ),
//                       );
//                     } else {
//                       // Combine all lyrics into one card
//                       final entry = _controller.savedEntries
//                           .first; // Assuming we show the first entry
//                       final lines = entry.lyrics.split('\n');
//
//                       return SingleChildScrollView(
//                         child: Card(
//                           margin: EdgeInsets.symmetric(vertical: 8.0),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           color: AppColor.secondaryColor.withOpacity(0.1),
//                           elevation: 2,
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 for (int lineIndex = 0;
//                                     lineIndex < lines.length;
//                                     lineIndex++)
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       // Render chords and lyrics for this line
//                                       Wrap(
//                                         children: lines[lineIndex]
//                                             .split(' ')
//                                             .asMap()
//                                             .entries
//                                             .map((wordEntry) {
//                                           final wordIndex = wordEntry.key;
//                                           final word = wordEntry.value;
//                                           final chord = entry.chords[lineIndex]
//                                                   ?[wordIndex] ??
//                                               '';
//
//                                           return Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 4.0),
//                                             child: Column(
//                                               children: [
//                                                 Text(
//                                                   chord,
//                                                   style: TextStyle(
//                                                     fontSize: 14.sp,
//                                                     color:
//                                                         AppColor.primaryColor,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   word,
//                                                   style: TextStyle(
//                                                     fontSize: 16.sp,
//                                                     color:
//                                                         AppColor.secondaryColor,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           );
//                                         }).toList(),
//                                       ),
//                                       SizedBox(height: 8),
//                                     ],
//                                   ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

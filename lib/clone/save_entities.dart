// import 'package:flutter/material.dart';
// import 'package:guitar_notes/global/constants/app_color.dart';
// //
// //
// // class SavedEntriesList extends StatelessWidget {
// //   final List<Map<String, dynamic>> savedEntries;
// //
// //   SavedEntriesList({required this.savedEntries});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       itemCount: savedEntries.length,
// //       itemBuilder: (context, index) {
// //         final entry = savedEntries[index];
// //         final lyrics = entry['lyrics'] as String;
// //         final chords = entry['chords'] as Map<int, Map<int, String>>;
// //
// //         return Card(
// //           color: AppColor.backgroundColor,
// //           margin: EdgeInsets.symmetric(vertical: 5),
// //           child: Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   'Saved Lyrics:',
// //                   style: TextStyle(
// //                       fontWeight: FontWeight.bold, color: Colors.white),
// //                 ),
// //                 const SizedBox(height: 5),
// //
// //                 // Loop through each line of lyrics
// //                 for (int lineIndex = 0;
// //                     lineIndex < lyrics.split('\n').length;
// //                     lineIndex++)
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       // Display chords above the corresponding words
// //                       Wrap(
// //                         children: [
// //                           for (int wordIndex = 0;
// //                               wordIndex <
// //                                   lyrics
// //                                       .split('\n')[lineIndex]
// //                                       .split(' ')
// //                                       .length;
// //                               wordIndex++)
// //                             Column(
// //                               children: [
// //                                 // Display chord if exists
// //
// //                                 Container(
// //                                   width:
// //                                       chords[lineIndex]?[wordIndex] != null &&
// //                                               chords[lineIndex]?[wordIndex]
// //                                                       ?.isNotEmpty ==
// //                                                   true
// //                                           ? 50
// //                                           : 0,
// //                                   padding: EdgeInsets.symmetric(
// //                                       horizontal: 5, vertical: 10),
// //                                   decoration: BoxDecoration(
// //                                       color: AppColor.secondaryColor,
// //                                       borderRadius: BorderRadius.circular(10)),
// //                                   child: Center(
// //                                     child: Text(
// //                                       chords[lineIndex]?[wordIndex] ?? '',
// //                                       style: TextStyle(
// //                                         color: Colors.black,
// //                                         fontWeight: FontWeight.bold,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 // SizedBox(height: 5),
// //                                 // Display the corresponding word with a space after it
// //                                 Text(
// //                                   lyrics
// //                                           .split('\n')[lineIndex]
// //                                           .split(' ')[wordIndex] +
// //                                       ' ',
// //                                   style: TextStyle(
// //                                     fontSize: 20,
// //                                     color: Colors.white,
// //                                     fontWeight: FontWeight.w500,
// //                                     fontFamily: "Inconsolata",
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 10),
// //                     ],
// //                   ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
//
// class SavedEntriesList extends StatelessWidget {
//   final List<Map<String, dynamic>> savedEntries;
//
//   SavedEntriesList({required this.savedEntries});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: savedEntries.length,
//       itemBuilder: (context, index) {
//         final entry = savedEntries[index];
//         final lyrics = entry['lyrics'] as String;
//         final chords = entry['chords'] as Map<int, Map<int, String>>;
//
//         return Card(
//           color: AppColor.backgroundColor,
//           margin: EdgeInsets.symmetric(vertical: 5),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Saved Lyrics:',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//                 const SizedBox(height: 10),
//
//                 // Loop through each line of lyrics
//                 for (int lineIndex = 0;
//                     lineIndex < lyrics.split('\n').length;
//                     lineIndex++)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Display chords above the corresponding words
//                       Wrap(
//                         alignment: WrapAlignment.start,
//                         children: [
//                           for (int wordIndex = 0;
//                               wordIndex <
//                                   lyrics
//                                       .split('\n')[lineIndex]
//                                       .split(' ')
//                                       .length;
//                               wordIndex++)
//                             Column(
//                               children: [
//                                 // Display the chord if it exists
//                                 if (chords[lineIndex]?[wordIndex]?.isNotEmpty ==
//                                     true)
//                                   Text(
//                                     chords[lineIndex]![wordIndex]!,
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.yellow,
//                                     ),
//                                   )
//                                 else
//                                   const SizedBox(
//                                       height: 16), // Spacer if no chord
//
//                                 // Display the word from the lyrics
//                                 Text(
//                                   lyrics
//                                       .split('\n')[lineIndex]
//                                       .split(' ')[wordIndex],
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                     ],
//                   ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

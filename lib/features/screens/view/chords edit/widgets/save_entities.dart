import 'package:flutter/material.dart';
import 'package:guitar_notes/global/constants/app_color.dart';
//

class SavedEntriesList extends StatelessWidget {
  final List<Map<String, dynamic>> savedEntries;

  SavedEntriesList({required this.savedEntries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: savedEntries.length,
      itemBuilder: (context, index) {
        final entry = savedEntries[index];
        final lyrics = entry['lyrics'] as String;
        final chords = entry['chords'] as Map<int, Map<int, String>>;

        return Card(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saved Lyrics:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),

                // Loop through each line of lyrics
                for (int lineIndex = 0;
                    lineIndex < lyrics.split('\n').length;
                    lineIndex++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display chords above the corresponding words
                      Wrap(
                        children: [
                          for (int wordIndex = 0;
                              wordIndex <
                                  lyrics
                                      .split('\n')[lineIndex]
                                      .split(' ')
                                      .length;
                              wordIndex++)
                            Column(
                              children: [
                                // Display chord if exists

                                Container(
                                  width:
                                      chords[lineIndex]?[wordIndex] != null &&
                                              chords[lineIndex]?[wordIndex]
                                                      ?.isNotEmpty ==
                                                  true
                                          ? 50
                                          : 0,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: AppColor.secondaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      chords[lineIndex]?[wordIndex] ?? '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                // SizedBox(height: 5),
                                // Display the corresponding word with a space after it
                                Text(
                                  lyrics
                                          .split('\n')[lineIndex]
                                          .split(' ')[wordIndex] +
                                      ' ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inconsolata",
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// This the recent code that i have written dont know why ???? last code
// //
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
//           margin: EdgeInsets.symmetric(vertical: 5),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Saved Lyrics:',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 5),
//
//                 // Process each line in lyrics
//                 for (int lineIndex = 0;
//                     lineIndex < lyrics.split('\n').length;
//                     lineIndex++)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Display chords above each word in the line
//                       Wrap(
//                         spacing: 2,
//                         children: List.generate(
//                           lyrics.split('\n')[lineIndex].split(' ').length,
//                           (wordIndex) {
//                             final word = lyrics
//                                 .split('\n')[lineIndex]
//                                 .split(' ')[wordIndex];
//                             final chord = chords[lineIndex]?[wordIndex] ?? '';
//
//                             return Column(
//                               children: [
//                                 // Display chord if exists
//                                 if (chord.isNotEmpty)
//                                   Text(
//                                     chord ?? "kkk",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 const SizedBox(height: 5),
//                                 // Display the corresponding word
//                                 Text(
//                                   '$word ',
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 10),
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

/// I think there is some error in this code . This is the first and second code that I have written
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
//           margin: EdgeInsets.symmetric(vertical: 5),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Saved Lyrics:',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 5),
//                 for (int lineIndex = 0;
//                     lineIndex < lyrics.split('\n').length;
//                     lineIndex++)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Display Chords (on top of lyrics)
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             for (int wordIndex = 0;
//                                 wordIndex <
//                                     lyrics
//                                         .split('\n')[lineIndex]
//                                         .split(' ')
//                                         .length;
//                                 wordIndex++)
//                               TextSpan(
//                                 text: '${chords[lineIndex]?[wordIndex] ?? ''} ',
//                                 style: TextStyle(
//                                   color: Colors.blue,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                       // Display Lyrics (below the chords)
//                       Text(
//                         lyrics.split('\n')[lineIndex],
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       const SizedBox(height: 10),
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
//           margin: EdgeInsets.symmetric(vertical: 5),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Saved Lyrics:',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 5),
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
//                                 // Display chord if exists
//                                 Text(
//                                   chords[lineIndex]?[wordIndex] ?? '',
//                                   style: TextStyle(
//                                     color: Colors.blue,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 // Display the corresponding word below the chord
//                                 Text(
//                                   lyrics
//                                       .split('\n')[lineIndex]
//                                       .split(' ')[wordIndex],
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ],
//                             ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
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
//

// // class ChordedLyric {
// //   final String lyrics;
// //   final Map<int, Map<int, String>> chords;
// //
// //   ChordedLyric({required this.lyrics, required this.chords});
// //
// //   factory ChordedLyric.fromJson(Map<String, dynamic> json) {
// //     return ChordedLyric(
// //       lyrics: json['lyrics'] as String,
// //       chords: (json['chords'] as Map<String, dynamic>).map(
// //         (lineIndex, chordMap) => MapEntry(
// //           int.parse(lineIndex),
// //           (chordMap as Map<String, dynamic>).map(
// //             (wordIndex, chord) =>
// //                 MapEntry(int.parse(wordIndex), chord as String),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     return {
// //       'lyrics': lyrics,
// //       'chords': chords.map(
// //         (lineIndex, chordMap) => MapEntry(
// //           lineIndex.toString(),
// //           chordMap
// //               .map((wordIndex, chord) => MapEntry(wordIndex.toString(), chord)),
// //         ),
// //       ),
// //     };
// //   }
// // }
//
// class ChordedLyric {
//   final String lyrics; // Full lyrics as plain text
//   final Map<int, Map<int, String>> chords; // lineIndex -> wordIndex -> chord
//
//   ChordedLyric({
//     required this.lyrics,
//     required this.chords,
//   });
//
//   factory ChordedLyric.fromJson(Map<String, dynamic> json) {
//     return ChordedLyric(
//       lyrics: json['lyrics'] as String,
//       chords:
//           (json['chords'] as Map<String, dynamic>).map<int, Map<int, String>>(
//         (lineIndex, wordMap) {
//           return MapEntry(
//             int.parse(lineIndex), // Convert lineIndex to int
//             (wordMap as Map<String, dynamic>).map<int, String>(
//               (wordIndex, chord) =>
//                   MapEntry(int.parse(wordIndex), chord as String),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'lyrics': lyrics,
//       'chords': chords.map((lineIndex, wordMap) {
//         return MapEntry(
//           lineIndex.toString(), // Convert lineIndex to String
//           wordMap
//               .map((wordIndex, chord) => MapEntry(wordIndex.toString(), chord)),
//         );
//       }),
//     };
//   }
// }

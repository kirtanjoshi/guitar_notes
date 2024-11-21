// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:guitar_notes/clone/model.dart';
// import 'package:guitar_notes/clone/shared.dart';
//
// class LyricsController extends GetxController {
//   final TextEditingController lyric = TextEditingController();
//   final TextEditingController capo = TextEditingController();
//   final TextEditingController artist = TextEditingController();
//   final TextEditingController strumming = TextEditingController();
//   final TextEditingController title = TextEditingController();
//   final chordMapping = <int, Map<int, String>>{}.obs;
//
//   final ChordedLyricStorage _storage = ChordedLyricStorage();
//
//   // Reactive list for saved entries
//   final RxList<ChordedLyric> savedEntries = <ChordedLyric>[].obs;
//
//   void updateChordMapping(int lineIndex, int wordIndex, String chord) {
//     if (!chordMapping.containsKey(lineIndex)) {
//       chordMapping[lineIndex] = {};
//     }
//     chordMapping[lineIndex]![wordIndex] = chord;
//     update();
//   }
//
//   // Save a new entry and update the saved list
//   // void saveLyrics() async {
//   //   final chordedLyric = ChordedLyric(
//   //     lyrics: lyric.text,
//   //     chords: chordMapping.map((key, value) {
//   //       return MapEntry(
//   //         key,
//   //         value.map((subKey, subValue) => MapEntry(subKey, subValue)),
//   //       );
//   //     }),
//   //   );
//   //
//   //   await _storage.saveChordedLyric(chordedLyric);
//   //   print("Lyrics and chords saved locally.");
//   // }
//
//   Future<void> saveLyrics() async {
//     var chordedLyric = ChordedLyric(
//       lyrics: lyric.text,
//       chords: chordMapping.map((key, value) {
//         return MapEntry(
//           key,
//           value.map((subKey, subValue) => MapEntry(subKey, subValue)),
//         );
//       }),
//     );
//
//     await _storage.saveChordedLyric(chordedLyric);
//
//     print("Lyrics and chords saved locally.$chordedLyric  ");
//   }
//
//   // Load all saved entries into the reactive list
//   Future<void> loadAllLyrics() async {
//     List<ChordedLyric> entries = await _storage.getAllChordedLyrics();
//     savedEntries.assignAll(entries);
//   }
// }

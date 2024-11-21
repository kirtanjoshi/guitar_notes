// // import 'dart:convert';
// //
// // import 'package:guitar_notes/clone/model.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // class ChordedLyricStorage {
// //   final String storageKey = "saved_chords_and_lyrics";
// //
// //   Future<void> saveChordedLyric(ChordedLyric chordedLyric) async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String jsonString = jsonEncode(chordedLyric.toJson());
// //     await prefs.setString(storageKey, jsonString);
// //     print("Chorded Lyric saved: $jsonString");
// //   }
// //
// //   Future<ChordedLyric?> getChordedLyric() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String? jsonString = prefs.getString(storageKey);
// //     if (jsonString != null) {
// //       print("Chorded Lyric retrieved: $jsonString");
// //       return ChordedLyric.fromJson(jsonDecode(jsonString));
// //     }
// //     return null;
// //   }
// //
// //   Future<void> deleteChordedLyric() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.remove(storageKey);
// //     print("Chorded Lyric deleted.");
// //   }
// // }
//
// import 'dart:convert';
//
// import 'package:guitar_notes/clone/model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ChordedLyricStorage {
//   final String _storageKey = "chordedLyrics";
//
//   // Save a single entry
//   Future<void> saveChordedLyric(ChordedLyric chordedLyric) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> savedList = prefs.getStringList(_storageKey) ?? [];
//     savedList.add(jsonEncode(chordedLyric.toJson()));
//     await prefs.setStringList(_storageKey, savedList);
//   }
//
//   // Retrieve all saved entries
//   Future<List<ChordedLyric>> getAllChordedLyrics() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> savedList = prefs.getStringList(_storageKey) ?? [];
//     return savedList
//         .map((item) => ChordedLyric.fromJson(jsonDecode(item)))
//         .toList();
//   }
//
//   // Clear all saved entries (optional utility)
//   Future<void> clearAllChordedLyrics() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_storageKey);
//   }
// }

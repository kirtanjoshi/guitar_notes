import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/data/local_storage/shared_preference.dart';

class LyricsController extends GetxController {
  final title = TextEditingController();
  final artist = TextEditingController();
  final capo = TextEditingController();
  final strummingPattern = TextEditingController();
  final lyric = TextEditingController();
  final chordMapping = <int, Map<int, String>>{}.obs;

  final SPStorage _storage = SPStorage();
  final String storageKey = "chords_and_lyrics";

  // Reactive list for saved entries
  // final entries = <Map<String, dynamic>>[].obs;
  final entries = <Map<String, dynamic>>[].obs;

  void updateChordMapping(int lineIndex, int wordIndex, String chord) {
    if (!chordMapping.containsKey(lineIndex)) {
      chordMapping[lineIndex] = {};
    }
    chordMapping[lineIndex]![wordIndex] = chord;
  }

  void saveLyrics() async {
    // Convert chordMapping to JSON-compatible structure
    final convertedChordMapping = chordMapping.map((lineIndex, wordsMap) {
      return MapEntry(
        lineIndex.toString(), // Convert lineIndex to String
        wordsMap.map((wordIndex, chord) => MapEntry(
              wordIndex.toString(), // Convert wordIndex to String
              chord ?? '', // Ensure no null values
            )),
      );
    });

    // Create a new entry with all keys and values properly formatted
    final newEntry = {
      "title": title.text,
      "artist": artist.text,
      "capo": capo.text,
      "strumming": strummingPattern.text,
      "lyrics": lyric.text,
      "chords": convertedChordMapping, // JSON-compatible Map
    };

    print("New Entry to Add: $newEntry"); // Debug print

    // Add new entry to entries
    entries.add(newEntry);

    print("All Entries Before Storing: $entries"); // Debug print

    try {
      // Store updated entries in SharedPreferences
      await _storage.storeAllData(storageKey, entries.toList());
    } catch (e) {
      print("Error during JSON encoding: $e"); // Catch and log encoding errors
    }
    print("Converted Chord Mapping: ${jsonEncode(convertedChordMapping)}");
  }

  void loadentries() async {
    List<Map<String, dynamic>>? data =
        await _storage.fetchAllData('chords_and_lyrics');
    if (data != null) {
      entries.value = data.map((entry) {
        final chords = (entry['chords'] as Map<String, dynamic>)
            .map((lineIndex, wordsMap) {
          return MapEntry(
            int.parse(lineIndex), // Convert lineIndex back to int
            (wordsMap as Map<String, dynamic>).map((wordIndex, chord) {
              return MapEntry(
                int.parse(wordIndex), // Convert wordIndex back to int
                chord as String,
              );
            }),
          );
        });

        return {
          'title': entry['title'],
          'artist': entry['artist'],
          'capo': entry['capo'],
          'strumming': entry['strumming'],
          'lyrics': entry['lyrics'],
          'chords': chords, // Now it's a Map<int, Map<int, String>>
        };
      }).toList();
    } else {
      print("No data found");
    }
  }

  void deleteAllEntries() async {
    await _storage.delete(storageKey);
    entries.clear();
  }

  /// Cheleko codeeee
  ///
// void loadentries() async {
//   List<Map<String, dynamic>>? data = await _storage.fetchAllData(storageKey);
//   if (data != null) {
//     entries.value = data.map((entry) {
//       final chords = (entry['chords'] as Map<String, dynamic>)
//           .map((lineIndex, wordsMap) {
//         return MapEntry(
//           int.parse(lineIndex), // Convert lineIndex back to int
//           (wordsMap as Map<String, dynamic>).map((wordIndex, chord) {
//             return MapEntry(
//               int.parse(wordIndex), // Convert wordIndex back to int
//               chord as String,
//             );
//           }),
//         );
//       });
//
//       return {
//         'title': entry['title'],
//         'artist': entry['artist'],
//         'capo': entry['capo'],
//         'strumming': entry['strumming'],
//         'lyrics': entry['lyrics'],
//         'chords': chords, // Now it's a Map<int, Map<int, String>>
//       };
//     }).toList();
//   }
// }

// void loadentries() async {
//   List<Map<String, dynamic>>? data =
//       await _storage.fetchAllData('chords_and_lyrics');
//   if (data != null) {
//     entries.value = data.map((entry) {
//       final chords = (entry['chords'] as Map<String, dynamic>)
//           .map((lineIndex, wordsMap) {
//         return MapEntry(
//           int.parse(lineIndex), // Convert lineIndex back to int
//           (wordsMap as Map<String, dynamic>).map((wordIndex, chord) {
//             return MapEntry(
//               int.parse(wordIndex), // Convert wordIndex back to int
//               chord as String,
//             );
//           }),
//         );
//       });
//
//       return {
//         'title': entry['title'],
//         'artist': entry['artist'],
//         'capo': entry['capo'],
//         'strumming': entry['strumming'],
//         'lyrics': entry['lyrics'],
//         'chords': chords, // Now it's a Map<int, Map<int, String>>
//       };
//     }).toList();
//   }
// }

// Conversion to int
// void loadentries() async {
//   List<Map<String, dynamic>>? data =
//       await _storage.fetchAllData('chords_and_lyrics');
//   if (data != null) {
//     entries.value = data.map((entry) {
//       // Cast 'chords' to Map<String, Map<String, String>> properly
//       final chords = (entry['chords'] as Map<String, dynamic>)
//           .map((lineIndex, wordsMap) {
//         return MapEntry(
//             lineIndex,
//             (wordsMap as Map<String, dynamic>).map((wordIndex, chord) {
//               return MapEntry(
//                   wordIndex, chord as String); // Cast wordIndex to String
//             }));
//       }).cast<String, Map<String, String>>();
//
//       return {
//         'title': entry['title'],
//         'artist': entry['artist'],
//         'capo': entry['capo'],
//         'strumming': entry['strumming'],
//         'lyrics': entry['lyrics'],
//         'chords': chords,
//       };
//     }).toList();
//   }
// }

// Load saved entries from SharedPreferences

//   void deleteAllEntries() async {
//     await _storage.delete(storageKey);
//     entries.clear();
//   }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:guitar_notes/clone2/shared_preference.dart';
//
// class LyricsController extends GetxController {
//   // Controllers for user input
//   final title = TextEditingController();
//   final artist = TextEditingController();
//   final capo = TextEditingController();
//   final strummingPattern = TextEditingController();
//   final lyric = TextEditingController();
//
//   // Reactive map for chord placements
//   final chordMapping = <int, Map<int, String>>{}.obs;
//
//   // List to hold saved entries
//   final entries = <Map<String, dynamic>>[].obs;
//
//   // Storage key and helper
//   final SPStorage _storage = SPStorage();
//   final String storageKey = "chords_and_lyrics";
//
//   // Save a new song
//   void saveSong() async {
//     // Convert chordMapping for JSON compatibility
//     final convertedChordMapping = chordMapping.map((lineIndex, wordsMap) {
//       return MapEntry(
//         lineIndex.toString(),
//         wordsMap
//             .map((wordIndex, chord) => MapEntry(wordIndex.toString(), chord)),
//       );
//     });
//
//     // Create a new song entry
//     final newSong = {
//       "title": title.text,
//       "artist": artist.text,
//       "capo": capo.text,
//       "strumming": strummingPattern.text,
//       "lyrics": lyric.text,
//       "chords": convertedChordMapping,
//     };
//
//     // Add to the reactive list and save to storage
//     entries.add(newSong);
//     await _storage.storeAllData(storageKey, entries);
//
//     print("Song saved: ${newSong['title']}");
//   }
//
//   // Load all songs from storage
//   void loadSongs() async {
//     List<Map<String, dynamic>>? data = await _storage.fetchAllData(storageKey);
//     if (data != null) {
//       entries.assignAll(data.map((entry) {
//         // Ensure chords are properly parsed and keys are converted back to int
//         final chords = (entry['chords'] as Map<String, dynamic>)
//             .map((lineIndex, wordsMap) {
//           return MapEntry(
//             int.parse(lineIndex),
//             (wordsMap as Map<String, dynamic>).map((wordIndex, chord) {
//               return MapEntry(int.parse(wordIndex), chord as String);
//             }),
//           );
//         });
//
//         return {
//           "title": entry["title"],
//           "artist": entry["artist"],
//           "capo": entry["capo"],
//           "strumming": entry["strumming"],
//           "lyrics": entry["lyrics"],
//           "chords": chords, // Chords are now corrected
//         };
//       }).toList());
//     }
//     print("Songs loaded: ${entries.length}");
//   }
//
//   // Update chord mapping
//   void updateChordMapping(int lineIndex, int wordIndex, String chord) {
//     if (!chordMapping.containsKey(lineIndex)) {
//       chordMapping[lineIndex] = {};
//     }
//     chordMapping[lineIndex]![wordIndex] = chord;
//   }
//
//   // Clear all saved songs
//   void deleteAllSongs() async {
//     await _storage.delete(storageKey);
//     entries.clear();
//     print("All songs deleted.");
//   }
// }

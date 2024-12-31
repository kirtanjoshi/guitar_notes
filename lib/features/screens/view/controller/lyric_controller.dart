import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String storageKey =
      "chords_and_lyrics_${FirebaseAuth.instance.currentUser?.email}";

  // Reactive list for saved entries
  final entries = <Map<String, dynamic>>[].obs;

  void updateChordMapping(int lineIndex, int wordIndex, String chord) {
    if (!chordMapping.containsKey(lineIndex)) {
      chordMapping[lineIndex] = {};
    }
    chordMapping[lineIndex]![wordIndex] = chord;
  }

  void clearEntries() {
    entries.clear();
  }

  // Save Lyrics to Local Storage and Firebase
  void saveLyrics() async {
    final convertedChordMapping = chordMapping.map((lineIndex, wordsMap) {
      return MapEntry(
        lineIndex.toString(),
        wordsMap.map((wordIndex, chord) => MapEntry(
              wordIndex.toString(),
              chord ?? '',
            )),
      );
    });

    final newEntry = {
      "title": title.text,
      "artist": artist.text,
      "capo": capo.text,
      "strumming": strummingPattern.text,
      "lyrics": lyric.text,
      "add_chords_screen": convertedChordMapping,
    };

    entries.add(newEntry);

    try {
      await _storage.storeAllData(storageKey, entries.toList());

      await _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.email)
          .collection('lyrics')
          .doc(newEntry['title'] as String)
          .set(newEntry);

      print("Entry saved locally and in Firebase: $newEntry");
    } catch (e) {
      print("Error during storage: $e");
    }
  }

  void loadEntries() async {
    final userEmail = FirebaseAuth.instance.currentUser?.email;
    if (userEmail == null) {
      print("No user logged in");
      return;
    }

    final userSpecificKey = "chords_and_lyrics_$userEmail";

    final Set<String> titlesSet =
        entries.map((e) => e['title'] as String).toSet();

    bool firebaseLoaded = false;

    try {
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(userEmail)
          .collection('lyrics')
          .get();

      if (snapshot.docs.isNotEmpty) {
        final firebaseData = snapshot.docs.map((doc) {
          return _convertChordMapping(doc.data() as Map<String, dynamic>);
        }).toList();

        for (var entry in firebaseData) {
          if (!titlesSet.contains(entry['title'])) {
            entries.add(entry);
            titlesSet.add(entry['title']);
          }
        }

        firebaseLoaded = true;
        print("Data loaded from Firebase: $firebaseData");
      }
    } catch (e) {
      print("Error loading data from Firebase: $e");
    }

    if (!firebaseLoaded) {
      List<Map<String, dynamic>>? localData =
          await _storage.fetchAllData(userSpecificKey);

      if (localData != null) {
        for (var entry in localData) {
          if (!titlesSet.contains(entry['title'])) {
            entries.add(_convertChordMapping(entry));
            titlesSet.add(entry['title']);
          }
        }
        print("Data loaded from Local Storage: $localData");
      } else {
        print("No data found in Local Storage");
      }
    }
  }

  void deleteEntry(String title) async {
    entries.removeWhere((entry) => entry['title'] == title);
    await _storage.storeAllData(storageKey, entries.toList());

    try {
      final userEmail = FirebaseAuth.instance.currentUser?.email;
      if (userEmail != null) {
        await _firestore
            .collection('users')
            .doc(userEmail)
            .collection('lyrics')
            .doc(title)
            .delete();
        print("Entry deleted locally and in Firebase: $title");
      }
    } catch (e) {
      print("Error deleting from Firebase: $e");
    }
  }

  Map<String, dynamic> _convertChordMapping(Map<String, dynamic> entry) {
    final chords = (entry['add_chords_screen'] as Map<String, dynamic>)
        .map((lineIndex, wordsMap) {
      return MapEntry(
        int.parse(lineIndex),
        (wordsMap as Map<String, dynamic>).map((wordIndex, chord) {
          return MapEntry(
            int.parse(wordIndex),
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
      'add_chords_screen': chords,
    };
  }
}

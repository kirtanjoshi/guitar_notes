import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LyricsController extends GetxController {
  final title = TextEditingController();
  final artist = TextEditingController();
  final capo = TextEditingController();
  final strummingPattern = TextEditingController();
  final lyric = TextEditingController();
  final chordMapping = <int, Map<int, String>>{}.obs;

  // Reactive list for saved entries
  final savedEntries = <Map<String, dynamic>>[].obs;

  void updateChordMapping(int lineIndex, int wordIndex, String chord) {
    if (!chordMapping.containsKey(lineIndex)) {
      chordMapping[lineIndex] = {};
    }
    chordMapping[lineIndex]![wordIndex] = chord;
  }

  void saveLyrics() {
    savedEntries.add({
      'lyrics': lyric.text,
      'chords': chordMapping,
    });
  }
}

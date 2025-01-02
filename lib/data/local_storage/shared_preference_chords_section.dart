import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceChords {
  // Text controllers for the chord input fields
  final titleController = TextEditingController();
  final artistController = TextEditingController();
  final capoController = TextEditingController();
  final strummingPatternController = TextEditingController();
  final lyricController = TextEditingController();
  final chordsController = TextEditingController();

  // Function to save chords as a list in SharedPreferences
  Future<void> saveChords() async {
    final prefs = await SharedPreferences.getInstance();

    // Create a map for the new chord
    final newChord = {
      'title': titleController.text,
      'artist': artistController.text,
      'capo': capoController.text,
      'strummingPattern': strummingPatternController.text,
      'lyric': lyricController.text,
      'chords': chordsController.text,
    };

    // Retrieve the existing list of chords from SharedPreferences
    List<Map<String, String>> chordList = [];
    final existingChords = prefs.getString('chordsList');
    if (existingChords != null) {
      chordList = List<Map<String, String>>.from(jsonDecode(existingChords));
    }

    // Add the new chord to the list
    chordList.add(newChord);

    // Save the updated list back to SharedPreferences
    await prefs.setString('chordsList', jsonEncode(chordList));

    // Clear the text fields
    titleController.clear();
    artistController.clear();
    capoController.clear();
    strummingPatternController.clear();
    lyricController.clear();
    chordsController.clear();
  }

  // Function to load the list of chords from SharedPreferences
  Future<List<Map<String, String>>> loadChords() async {
    final prefs = await SharedPreferences.getInstance();
    final chordsList = prefs.getString('chordsList');
    if (chordsList != null) {
      return List<Map<String, String>>.from(jsonDecode(chordsList));
    }
    return [];
  }

  // Function to clear the saved chords in SharedPreferences
  Future<void> clearChords() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('chordsList');
  }
}

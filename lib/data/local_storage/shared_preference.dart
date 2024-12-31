import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SPStorage {
  Future<void> storeAllData(
      String key, List<Map<String, dynamic>> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      // Convert entire list to ensure all keys are strings
      final jsonCompatibleList = value.map((entry) {
        return entry.map((k, v) {
          if (k == 'add_chords_screen' && v is Map) {
            // Convert 'add_chords_screen' to ensure all keys are strings
            return MapEntry(
              k,
              (v as Map).map((lineIndex, wordsMap) {
                return MapEntry(
                  lineIndex.toString(),
                  (wordsMap as Map).map((wordIndex, chord) {
                    return MapEntry(wordIndex.toString(), chord);
                  }),
                );
              }),
            );
          }
          return MapEntry(k, v);
        });
      }).toList();

      String jsonString = jsonEncode(jsonCompatibleList);

      print("JSON String to Store: $jsonString");
      await prefs.setString(key, jsonString);
    } catch (e) {
      print("Error during JSON encoding: $e");
    }
  }

  // Fetch data from SharedPreferences
  Future<List<Map<String, dynamic>>?> fetchAllData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);
    if (jsonString != null) {
      try {
        return (jsonDecode(jsonString) as List)
            .map((item) => Map<String, dynamic>.from(item))
            .toList();
      } catch (e) {
        print("Error during data fetch: $e");
      }
    }
    return null;
  }

  // Delete specific data by key
  Future<void> delete(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    print("Data deleted from Shared Preferences for key: $key");
  }
}

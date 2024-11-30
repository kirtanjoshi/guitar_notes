// class SPStorage {
//   // Future<void> writeSecureStorage(String key, dynamic value) async {
//   //   await storage.write(key: key, value: value);
//   //   print("Data Saved :$value");
//   // }
//   //
//   // Future<String?> readSecureStorage(String key) async {
//   //   String value = await storage.read(key: key) ?? "No data Found";
//   //   print("Data read from Secure Storage :$value");
//   // }
//
//   fetchAllData(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     String? stringValue = prefs.getString(key);
//     print("Data read from Secure Storage :$stringValue");
//     return stringValue;
//   }
//
//   storeAllData(String key, String value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(key, value);
//     print("Data stored from Secuare Storage :$value");
//   }
//
//   delete(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     var stringValue = await prefs.remove(key);
//     print("Data deleted from Secure Storage :$stringValue");
//     return stringValue;
//   }
//
//   // Future<void> deleteSecure(String key) async {
//   //   await storage.delete(key: key);
//   // }
// }
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
          if (k == 'chords' && v is Map) {
            // Convert 'chords' to ensure all keys are strings
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

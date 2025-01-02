import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreStorage {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Store data for the logged-in user
  Future<void> storeAllData(List<Map<String, dynamic>> value) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("User not logged in");
    }

    try {
      // Convert the value into JSON-compatible format
      final jsonCompatibleList = value.map((entry) {
        return entry.map((k, v) {
          if (k == 'add_chords_screen' && v is Map) {
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

      await _firestore.collection('user_data').doc(user.email).set({
        'data': jsonCompatibleList,
      });
    } catch (e) {
      print("Error during Firestore storage: $e");
    }
  }

  // Fetch data for the logged-in user
  Future<List<Map<String, dynamic>>?> fetchAllData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("User not logged in");
    }

    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('user_data').doc(user.email).get();

      if (snapshot.exists) {
        List<dynamic> data = snapshot.get('data');
        return data.map((item) => Map<String, dynamic>.from(item)).toList();
      }
    } catch (e) {
      print("Error during Firestore fetch: $e");
    }

    return null;
  }

  // Delete all data for the logged-in user
  Future<void> deleteAllData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("User not logged in");
    }

    try {
      await _firestore.collection('user_data').doc(user.email).delete();
      print("Data deleted for user: ${user.email}");
    } catch (e) {
      print("Error during Firestore delete: $e");
    }
  }
}

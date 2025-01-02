import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChordsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<Map<String, dynamic>> chordList =
      <Map<String, dynamic>>[].obs; // RxList for GetX

  final title = TextEditingController();
  final artist = TextEditingController();
  final capo = TextEditingController();
  final strummingPattern = TextEditingController();
  final lyric = TextEditingController();
  final chords = TextEditingController();

  final user = FirebaseAuth.instance.currentUser?.email;

  // Fetch all chords for the current user
  Future<void> fetchUsers() async {
    if (user == null) {
      Get.snackbar('Error', 'User not logged in.');
      return;
    }

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult == ConnectivityResult.none) {
        print('No internet connection. Loading from local storage.');
        await loadChords();
      } else {
        print('Internet connection available. Loading from Firebase.');
        QuerySnapshot snapshot = await _firestore
            .collection('users')
            .doc(user) // Correctly associate with current user
            .collection('chords')
            .get();

        chordList.assignAll(snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return {
            'id': doc.id,
            'title': data['title'],
            'artist': data['artist'],
            'capo': data['capo'],
            // 'strummingPattern': data['strummingPattern'],
            'chords': data['chords'],
          };
        }).toList());
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch chords: $e');
      print('Error: $e');
    }
  }

  // Add a new chord for the current user
  Future<void> addUser() async {
    if (user == null) {
      Get.snackbar('Error', 'User not logged in.');
      return;
    }
    final newEntry = {
      "title": title.text,
      "artist": artist.text,
      "capo": capo.text,
      "strumming": strummingPattern.text,
      "chords": chords.text,
    };
    try {
      await _firestore
          .collection('users')
          .doc(user) // Associate with current user
          .collection('chords')
          .doc(newEntry['title'] as String)
          .set(newEntry);

      // Clear text controllers
      title.clear();
      artist.clear();
      capo.clear();
      strummingPattern.clear();
      lyric.clear();
      chords.clear();

      fetchUsers();
      Get.snackbar('Success', 'Chord added successfully.');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add chord: $e');
      print('Error: $e');
    }
  }

  // Update a chord for the current user
  Future<void> updateUser(String id) async {
    if (user == null) {
      Get.snackbar('Error', 'User not logged in.');
      return;
    }

    try {
      await _firestore
          .collection('users')
          .doc(user) // Correctly associate with current user
          .collection('chords')
          .doc(id)
          .update({
        'title': title.text,
        'artist': artist.text,
        'capo': capo.text,
        'strummingPattern': strummingPattern.text,
        'lyric': lyric.text,
        'chords': chords.text,
      });

      // Clear text controllers
      title.clear();
      artist.clear();
      capo.clear();
      strummingPattern.clear();
      lyric.clear();
      chords.clear();

      fetchUsers(); // Refresh the list
      Get.snackbar('Success', 'Chord updated successfully.');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update chord: $e');
      print('Error: $e');
    }
  }

  // Delete a chord for the current user
  Future<void> deleteUser(String id) async {
    if (user == null) {
      Get.snackbar('Error', 'User not logged in.');
      return;
    }

    try {
      await _firestore
          .collection('users')
          .doc(user)
          .collection('chords')
          .doc(id)
          .delete();

      fetchUsers(); // Refresh the list
      Get.snackbar('Success', 'Chord deleted successfully.');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete chord: $e');
      print('Error: $e');
    }
  }

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  // Function to save chords in SharedPreferences
  Future<void> saveChords() async {
    final prefs = await SharedPreferences.getInstance();

    final newChord = {
      'title': title.text,
      'artist': artist.text,
      'capo': capo.text,
      'strummingPattern': strummingPattern.text,
      'chords': chords.text,
    };

    try {
      final existingChords = prefs.getString('chordsList');
      if (existingChords != null) {
        List<Map<String, dynamic>> savedChords =
            List<Map<String, dynamic>>.from(jsonDecode(existingChords));
        savedChords.add(newChord);

        await prefs.setString('chordsList', jsonEncode(savedChords));
      } else {
        await prefs.setString('chordsList', jsonEncode([newChord]));
      }

      Get.snackbar('Success', 'Chord saved locally.');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save chord locally: $e');
      print('Error: $e');
    }

    // Clear the text fields
    title.clear();
    artist.clear();
    capo.clear();
    strummingPattern.clear();
    chords.clear();
  }

  // Function to load the list of chords from SharedPreferences
  Future<void> loadChords() async {
    final prefs = await SharedPreferences.getInstance();
    final chordsList = prefs.getString('chordsList');

    try {
      if (chordsList != null) {
        List<Map<String, dynamic>> loadedChords =
            List<Map<String, dynamic>>.from(jsonDecode(chordsList));
        chordList.assignAll(loadedChords);
        Get.snackbar('Success', 'Chords loaded from local storage.');
      } else {
        Get.snackbar('Info', 'No chords found in local storage.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load chords: $e');
      print('Error: $e');
    }
  }

  // Function to clear the saved chords in SharedPreferences
  Future<void> clearChords() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      await prefs.remove('chordsList');
      chordList.clear();
      Get.snackbar('Success', 'All chords cleared from local storage.');
    } catch (e) {
      Get.snackbar('Error', 'Failed to clear chords: $e');
      print('Error: $e');
    }
  }
}

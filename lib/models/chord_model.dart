import 'dart:convert';

class ChordNote {
  final String title;
  final String artist;
  final String capoFret;
  final String strummingPattern;
  final String lyrics;
  final Map<int, Map<int, String>> chordMapping;

  ChordNote({
    required this.title,
    required this.artist,
    required this.capoFret,
    required this.strummingPattern,
    required this.lyrics,
    required this.chordMapping,
  });

  // Convert a ChordNote object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'artist': artist,
      'capoFret': capoFret,
      'strummingPattern': strummingPattern,
      'lyrics': lyrics,
      'chordMapping': chordMapping,
    };
  }

  // Create a ChordNote object from JSON
  factory ChordNote.fromJson(Map<String, dynamic> json) {
    return ChordNote(
      title: json['title'],
      artist: json['artist'],
      capoFret: json['capoFret'],
      strummingPattern: json['strummingPattern'],
      lyrics: json['lyrics'],
      chordMapping: Map<int, Map<int, String>>.from(json['chordMapping']),
    );
  }

  // Convert a list of ChordNote objects to JSON
  static String encode(List<ChordNote> notes) {
    return jsonEncode(notes.map((note) => note.toJson()).toList());
  }

  // Decode a JSON string into a list of ChordNote objects
  static List<ChordNote> decode(String notes) {
    return (jsonDecode(notes) as List<dynamic>)
        .map((note) => ChordNote.fromJson(note))
        .toList();
  }
}

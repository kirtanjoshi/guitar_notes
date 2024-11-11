import 'package:flutter/material.dart';

class SavedEntriesList extends StatelessWidget {
  final List<Map<String, dynamic>> savedEntries;

  SavedEntriesList({required this.savedEntries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: savedEntries.length,
      itemBuilder: (context, index) {
        final entry = savedEntries[index];
        final lyrics = entry['lyrics'] as String;
        final chords = entry['chords'] as Map<int, Map<int, String>>;

        return Card(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Saved Lyrics:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                for (int lineIndex = 0;
                    lineIndex < lyrics.split('\n').length;
                    lineIndex++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display Chords (on top of lyrics)
                      RichText(
                        text: TextSpan(
                          children: [
                            for (int wordIndex = 0;
                                wordIndex <
                                    lyrics
                                        .split('\n')[lineIndex]
                                        .split(' ')
                                        .length;
                                wordIndex++)
                              TextSpan(
                                text: '${chords[lineIndex]?[wordIndex] ?? ''} ',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                      // Display Lyrics (below the chords)
                      Text(
                        lyrics.split('\n')[lineIndex],
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

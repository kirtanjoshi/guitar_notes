import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChordsNoteScreen extends StatefulWidget {
  @override
  _ChordsNoteScreenState createState() => _ChordsNoteScreenState();
}

class _ChordsNoteScreenState extends State<ChordsNoteScreen> {
  final _controller = Get.put(LyricsController());
  final List<String> chords = ['G', 'Am7', 'Cm', 'D', 'Em']; // List of chords
  // Map of lines and word indices to chords

  // List to hold saved chorded lyrics
  List<Map<String, dynamic>> savedEntries = [];

  @override
  void dispose() {
    _controller.lyric.dispose();
    super.dispose();
  }

  // Method to save the lyrics and chord mapping
  void saveLyrics() {
    setState(() {
      savedEntries.add({
        'lyrics': _controller.lyric.text,
        'chords': _controller.chordMapping,
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print(
        "Title ${_controller.title.value.text}"); // Print the value here for debugging
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chord Note App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(_controller.title.value.text),
            // Chords as Draggable items
            Wrap(
              spacing: 10.0,
              children: chords.map((chord) {
                return Draggable<String>(
                  data: chord,
                  feedback: Material(
                    color: Colors.transparent,
                    child: Text(
                      chord,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  child: Chip(
                    label: Text(chord),
                    backgroundColor: Colors.blueAccent,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Lyrics with Drop Targets for chords
            Expanded(
              child: LyricsWithChords(
                lyricsController: _controller.lyric,
                chordMapping: _controller.chordMapping,
                onChordDropped: (lineIndex, wordIndex, chord) {
                  setState(() {
                    // Initialize line map if it doesn't exist
                    if (!_controller.chordMapping.containsKey(lineIndex)) {
                      _controller.chordMapping[lineIndex] = {};
                    }
                    // Set chord for specific word in line
                    _controller.chordMapping[lineIndex]![wordIndex] = chord;
                  });
                },
              ),
            ),

            // Save Button
            ElevatedButton(
              onPressed: saveLyrics,
              child: Text('Save'),
            ),

            // Display saved entries
            // Expanded(
            //   child: SavedEntriesList(savedEntries: savedEntries),
            // ),
          ],
        ),
      ),
    );
  }
}

class LyricsWithChords extends StatelessWidget {
  final TextEditingController lyricsController;
  final Map<int, Map<int, String>> chordMapping;
  final void Function(int, int, String) onChordDropped;

  LyricsWithChords({
    required this.lyricsController,
    required this.chordMapping,
    required this.onChordDropped,
  });

  @override
  Widget build(BuildContext context) {
    final lines = lyricsController.text.split('\n');

    return ListView.builder(
      itemCount: lines.length,
      itemBuilder: (context, lineIndex) {
        final words = lines[lineIndex].split(' ');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8.0,
              children: List.generate(words.length, (wordIndex) {
                final chordAbove = chordMapping[lineIndex]?[wordIndex];

                return Column(
                  children: [
                    // Chord Display (if any chord is assigned)
                    Text(
                      chordAbove ?? '',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Word with DragTarget for chord
                    DragTarget<String>(
                      onAccept: (chord) {
                        onChordDropped(lineIndex, wordIndex, chord);
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Text(
                          words[wordIndex],
                          style: TextStyle(
                            fontSize: 16,
                            decoration: candidateData.isNotEmpty
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        );
                      },
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}

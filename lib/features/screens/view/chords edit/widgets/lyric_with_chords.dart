import 'package:flutter/material.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

class LyricsWithChords extends StatelessWidget {
  final TextEditingController lyricsController;
  final Map<int, Map<int, String>> chordMapping;
  final Function(int, int, String) onWordTapped;
  final void Function(int, int, String) onChordDropped;

  LyricsWithChords({
    required this.lyricsController,
    required this.chordMapping,
    required this.onWordTapped,
    required this.onChordDropped,
  });

  @override
  Widget build(BuildContext context) {
    final lines = lyricsController.text
        .split('\n')
        // .where((line) => line.trim().isNotEmpty) // Remove any empty lines
        .toList();

    return ListView.builder(
      itemCount: lines.length,
      itemBuilder: (context, lineIndex) {
        final words = lines[lineIndex].split(' ');

        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 0), // Reduced gap between lines
          child: Wrap(
            spacing: 5.0,
            children: List.generate(words.length, (wordIndex) {
              final chordAbove = chordMapping[lineIndex]?[wordIndex];
              return GestureDetector(
                onTap: () =>
                    onWordTapped(lineIndex, wordIndex, words[wordIndex]),
                child: Column(
                  children: [
                    // Fixed-height container for chord, with conditional visibility
                    Container(
                      width:
                          chordAbove != null && chordAbove.isNotEmpty ? 50 : 0,
                      // Reserve space for the chord container
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          chordAbove ?? "",
                          style: TextStyle(
                            fontFamily: "Inconsolata",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5), // Space between chord and word
                    // DragTarget for the word
                    Container(
                      child: DragTarget<String>(
                        onAccept: (chord) {
                          onChordDropped(lineIndex, wordIndex, chord);
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Text(
                            words[wordIndex],
                            style: TextStyle(
                              fontSize: 20,
                              color: candidateData.isNotEmpty
                                  ? Colors.green
                                  : AppColor.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Inconsolata",
                              decoration: candidateData.isNotEmpty
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

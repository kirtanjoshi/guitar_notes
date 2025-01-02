import 'package:flutter/material.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

class LyricsWithChordsWidget extends StatelessWidget {
  const LyricsWithChordsWidget({
    super.key,
    required this.lyrics,
    required this.chords,
  });

  final String lyrics;
  final Map<int, Map<int, String>> chords;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.backgroundColor,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int lineIndex = 0;
                lineIndex < lyrics.split('\n').length;
                lineIndex++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      for (int wordIndex = 0;
                          wordIndex <
                              lyrics.split('\n')[lineIndex].split(' ').length;
                          wordIndex++)
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 3),
                              width: chords[lineIndex]?[wordIndex] != null &&
                                      chords[lineIndex]?[wordIndex]
                                              ?.isNotEmpty ==
                                          true
                                  ? 50
                                  : 0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                color: AppColor.secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  chords[lineIndex]?[wordIndex] ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              lyrics
                                      .split('\n')[lineIndex]
                                      .split(' ')[wordIndex] +
                                  ' ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inconsolata",
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

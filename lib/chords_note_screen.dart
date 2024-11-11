// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
// //
// // class ChordsNoteScreen extends StatefulWidget {
// //   @override
// //   _ChordsNoteScreenState createState() => _ChordsNoteScreenState();
// // }
// //
// // class _ChordsNoteScreenState extends State<ChordsNoteScreen> {
// //   final _controller = Get.put(LyricsController());
// //   final List<String> chords = ['G', 'Am7', 'Cm', 'D', 'Em']; // List of chords
// //   // Map of lines and word indices to chords
// //
// //   // List to hold saved chorded lyrics
// //   List<Map<String, dynamic>> savedEntries = [];
// //
// //   @override
// //   void dispose() {
// //     _controller.lyric.dispose();
// //     super.dispose();
// //   }
// //
// //   // Method to save the lyrics and chord mapping
// //   void saveLyrics() {
// //     setState(() {
// //       savedEntries.add({
// //         'lyrics': _controller.lyric.text,
// //         'chords': _controller.chordMapping,
// //       });
// //     });
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     print(
// //         "Title ${_controller.title.value.text}"); // Print the value here for debugging
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Chord Note App'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             Text(_controller.title.value.text),
// //             // Chords as Draggable items
// //             Wrap(
// //               spacing: 10.0,
// //               children: chords.map((chord) {
// //                 return Draggable<String>(
// //                   data: chord,
// //                   feedback: Material(
// //                     color: Colors.transparent,
// //                     child: Text(
// //                       chord,
// //                       style: TextStyle(
// //                         color: Colors.blue,
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 18,
// //                       ),
// //                     ),
// //                   ),
// //                   child: Chip(
// //                     label: Text(chord),
// //                     backgroundColor: Colors.blueAccent,
// //                     labelStyle: TextStyle(color: Colors.white),
// //                   ),
// //                 );
// //               }).toList(),
// //             ),
// //             const SizedBox(height: 16),
// //
// //             // Lyrics with Drop Targets for chords
// //             Expanded(
// //               child: LyricsWithChords(
// //                 lyricsController: _controller.lyric,
// //                 chordMapping: _controller.chordMapping,
// //                 onChordDropped: (lineIndex, wordIndex, chord) {
// //                   setState(() {
// //                     // Initialize line map if it doesn't exist
// //                     if (!_controller.chordMapping.containsKey(lineIndex)) {
// //                       _controller.chordMapping[lineIndex] = {};
// //                     }
// //                     // Set chord for specific word in line
// //                     _controller.chordMapping[lineIndex]![wordIndex] = chord;
// //                   });
// //                 },
// //               ),
// //             ),
// //
// //             // Save Button
// //             ElevatedButton(
// //               onPressed: saveLyrics,
// //               child: Text('Save'),
// //             ),
// //
// //             // Display saved entries
// //             // Expanded(
// //             //   child: SavedEntriesList(savedEntries: savedEntries),
// //             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class LyricsWithChords extends StatelessWidget {
// //   final TextEditingController lyricsController;
// //   final Map<int, Map<int, String>> chordMapping;
// //   final void Function(int, int, String) onChordDropped;
// //
// //   LyricsWithChords({
// //     required this.lyricsController,
// //     required this.chordMapping,
// //     required this.onChordDropped,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final lines = lyricsController.text.split('\n');
// //
// //     return ListView.builder(
// //       itemCount: lines.length,
// //       itemBuilder: (context, lineIndex) {
// //         final words = lines[lineIndex].split(' ');
// //
// //         return Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Wrap(
// //               spacing: 8.0,
// //               children: List.generate(words.length, (wordIndex) {
// //                 final chordAbove = chordMapping[lineIndex]?[wordIndex];
// //
// //                 return Column(
// //                   children: [
// //                     // Chord Display (if any chord is assigned)
// //                     Text(
// //                       chordAbove ?? '',
// //                       style: TextStyle(
// //                         color: Colors.blue,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     // Word with DragTarget for chord
// //                     DragTarget<String>(
// //                       onAccept: (chord) {
// //                         onChordDropped(lineIndex, wordIndex, chord);
// //                       },
// //                       builder: (context, candidateData, rejectedData) {
// //                         return Text(
// //                           words[wordIndex],
// //                           style: TextStyle(
// //                             fontSize: 16,
// //                             decoration: candidateData.isNotEmpty
// //                                 ? TextDecoration.underline
// //                                 : TextDecoration.none,
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ],
// //                 );
// //               }),
// //             ),
// //             const SizedBox(height: 10),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }
//
// //
// //

/// This code add textfield into each words
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ChordsNoteScreen extends StatefulWidget {
//   @override
//   _ChordsNoteScreenState createState() => _ChordsNoteScreenState();
// }
//
// class _ChordsNoteScreenState extends State<ChordsNoteScreen> {
//   final _controller = Get.put(LyricsController());
//
//   @override
//   void dispose() {
//     _controller.lyric.dispose();
//     for (var line in _controller.chordControllers.values) {
//       for (var controller in line.values) {
//         controller.dispose();
//       }
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chord Note App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(_controller.title.value.text),
//             Expanded(
//               child: LyricsWithChords(
//                 lyricsController: _controller.lyric,
//                 chordMapping: _controller.chordMapping,
//                 chordControllers: _controller.chordControllers,
//                 onChordChanged: _controller.updateChordMapping,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LyricsWithChords extends StatelessWidget {
//   final TextEditingController lyricsController;
//   final Map<int, Map<int, String>> chordMapping;
//   final Map<int, Map<int, TextEditingController>> chordControllers;
//   final void Function(int, int, String) onChordChanged;
//
//   LyricsWithChords({
//     required this.lyricsController,
//     required this.chordMapping,
//     required this.chordControllers,
//     required this.onChordChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final lines = lyricsController.text.split('\n');
//
//     return ListView.builder(
//       itemCount: lines.length,
//       itemBuilder: (context, lineIndex) {
//         final words = lines[lineIndex].split(' ');
//
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Wrap(
//               spacing: 8.0,
//               children: List.generate(words.length, (wordIndex) {
//                 chordControllers.putIfAbsent(lineIndex, () => {});
//                 chordControllers[lineIndex]!.putIfAbsent(
//                   wordIndex,
//                   () => TextEditingController(
//                     text: chordMapping[lineIndex]?[wordIndex] ?? '',
//                   ),
//                 );
//
//                 final controller = chordControllers[lineIndex]![wordIndex]!;
//
//                 return Column(
//                   children: [
//                     SizedBox(
//                       width: 40,
//                       child: TextField(
//                         controller: controller,
//                         decoration: InputDecoration(
//                           hintText: 'Chord',
//                           hintStyle:
//                               TextStyle(fontSize: 12, color: Colors.grey),
//                           border: InputBorder.none,
//                         ),
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                         onChanged: (value) {
//                           onChordChanged(lineIndex, wordIndex, value);
//                         },
//                       ),
//                     ),
//                     Text(
//                       words[wordIndex],
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 );
//               }),
//             ),
//             const SizedBox(height: 10),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class LyricsController extends GetxController {
//   final title = TextEditingController();
//   final artist = TextEditingController();
//   final lyric = TextEditingController();
//   final strummingPattern = TextEditingController();
//   final capo = TextEditingController();
//
//   final chordMapping = <int, Map<int, String>>{}.obs;
//   final chordControllers = <int, Map<int, TextEditingController>>{};
//
//   void updateChordMapping(int lineIndex, int wordIndex, String chord) {
//     if (!chordMapping.containsKey(lineIndex)) {
//       chordMapping[lineIndex] = {};
//     }
//     chordMapping[lineIndex]![wordIndex] = chord;
//   }
// }

/// Tap to add the chords
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChordsNoteScreen extends StatefulWidget {
  @override
  _ChordsNoteScreenState createState() => _ChordsNoteScreenState();
}

class _ChordsNoteScreenState extends State<ChordsNoteScreen> {
  final _controller = Get.put(LyricsController());
  final List<String> chords = ['G', 'Am7', 'Cm', 'D', 'Em']; // List of chords
  final TextEditingController chordEditorController = TextEditingController();
  // List to hold saved chorded lyrics
  List<Map<String, dynamic>> savedEntries = [];

  int? selectedLineIndex;
  int? selectedWordIndex;

  @override
  void dispose() {
    _controller.lyric.dispose();
    chordEditorController.dispose();
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

  void _onWordTapped(int lineIndex, int wordIndex, String word) {
    setState(() {
      selectedLineIndex = lineIndex;
      selectedWordIndex = wordIndex;
      chordEditorController.text =
          _controller.chordMapping[lineIndex]?[wordIndex] ?? '';
      chordEditorController.selection =
          TextSelection.collapsed(offset: chordEditorController.text.length);
    });
  }

  void _onChordEdited(String newChord) {
    if (selectedLineIndex != null && selectedWordIndex != null) {
      _controller.updateChordMapping(
          selectedLineIndex!, selectedWordIndex!, newChord);
      setState(() {});
    }
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
            Expanded(
              child: LyricsWithChords(
                lyricsController: _controller.lyric,
                chordMapping: _controller.chordMapping,
                onWordTapped: _onWordTapped,
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
            if (selectedLineIndex != null && selectedWordIndex != null)
              TextField(
                controller: chordEditorController,
                onChanged: _onChordEdited,
                decoration: InputDecoration(
                  labelText:
                      'Edit Chord for "${_controller.lyric.text.split('\n')[selectedLineIndex!].split(' ')[selectedWordIndex!]}"',
                  border: OutlineInputBorder(),
                ),
              ),

            // ElevatedButton(
            //   onPressed: saveLyrics,
            //   child: Text('Save'),
            // ),
            //
            // // Display saved entries
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
              vertical: 2.0), // Reduced gap between lines
          child: Wrap(
            spacing: 8.0,
            children: List.generate(words.length, (wordIndex) {
              final chordAbove = chordMapping[lineIndex]?[wordIndex];

              return GestureDetector(
                onTap: () =>
                    onWordTapped(lineIndex, wordIndex, words[wordIndex]),
                child: Column(
                  children: [
                    Text(
                      chordAbove ?? '',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Text(
                    //   words[wordIndex],
                    //   style: TextStyle(fontSize: 16),
                    // ),
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
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class LyricsController extends GetxController {
  final title = TextEditingController();
  final lyric = TextEditingController();
  final chordMapping = <int, Map<int, String>>{}.obs;

  void updateChordMapping(int lineIndex, int wordIndex, String chord) {
    if (!chordMapping.containsKey(lineIndex)) {
      chordMapping[lineIndex] = {};
    }
    chordMapping[lineIndex]![wordIndex] = chord;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/chords%20edit/widgets/chip_widget.dart';
import 'package:guitar_notes/features/screens/view/chords%20edit/widgets/details_widget.dart';
import 'package:guitar_notes/features/screens/view/chords%20edit/widgets/lyric_with_chords.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
// import 'package:guitar_notes/features/screens/view/add_chords_screen%20edit/widgets/lyric_with_chordse_screen.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

class ChordsNoteScreen extends StatefulWidget {
  @override
  _ChordsNoteScreenState createState() => _ChordsNoteScreenState();
}

class _ChordsNoteScreenState extends State<ChordsNoteScreen> {
  List<Map<String, dynamic>> savedEntries = [];
  final _controller = Get.put(LyricsController());

  final TextEditingController chordEditorController = TextEditingController();
  final List<String> chords = [
    'G',
    'D',
    'E',
    'Em',
    'A',
    'Am',
    'Am7',
    "Caad9",
    "F",
  ];
  // List to hold saved chorded lyrics

  int? selectedLineIndex;
  int? selectedWordIndex;

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

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       backgroundColor: Color(0xFF1b1c1d),
  //       body: Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: Container(
  //           margin: EdgeInsets.all(10),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               DetailsWidget(),
  //               ChipWidget(add_chords_screen: add_chords_screen),
  //               const SizedBox(height: 16),
  //               Text(
  //                 "Intro",
  //                 style: TextStyle(
  //                     color: AppColor.secondaryColor,
  //                     fontFamily: "Inconsolata"),
  //               ),
  //               Gap(0.02.sh),
  //               Expanded(
  //                 child: LyricsWithChords(
  //                   lyricsController: _controller.lyric,
  //                   chordMapping: _controller.chordMapping,
  //                   onWordTapped: _onWordTapped,
  //                   onChordDropped: (lineIndex, wordIndex, chord) {
  //                     setState(() {
  //                       // Initialize line map if it doesn't exist
  //                       if (!_controller.chordMapping.containsKey(lineIndex)) {
  //                         _controller.chordMapping[lineIndex] = {};
  //                       }
  //                       // Set chord for specific word in line
  //                       _controller.chordMapping[lineIndex]![wordIndex] = chord;
  //                     });
  //                   },
  //                 ),
  //               ),
  //               if (selectedLineIndex != null && selectedWordIndex != null)
  //                 TextField(
  //                   style: TextStyle(color: AppColor.secondaryColor),
  //                   controller: chordEditorController,
  //                   onChanged: _onChordEdited,
  //                   decoration: InputDecoration(
  //                     fillColor: AppColor.secondaryColor,
  //                     focusColor: AppColor.secondaryColor,
  //                     labelText:
  //                         'Edit Chord for "${_controller.lyric.text.split('\n')[selectedLineIndex!].split(' ')[selectedWordIndex!]}"',
  //                     border: OutlineInputBorder(),
  //                   ),
  //                 ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1b1c1d),
        body: SingleChildScrollView(
          // Allow scrolling for overflowing content
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsWidget(),
                  ChipWidget(chords: chords),
                  const SizedBox(height: 16),
                  Text(
                    "Intro",
                    style: TextStyle(
                        color: AppColor.secondaryColor,
                        fontFamily: "Inconsolata"),
                  ),
                  Gap(0.02.sh),
                  Container(
                    height: MediaQuery.of(context).size.height *
                        0.5, // Constrain height
                    child: LyricsWithChords(
                      lyricsController: _controller.lyric,
                      chordMapping: _controller.chordMapping,
                      onWordTapped: _onWordTapped,
                      onChordDropped: (lineIndex, wordIndex, chord) {
                        setState(() {
                          if (!_controller.chordMapping
                              .containsKey(lineIndex)) {
                            _controller.chordMapping[lineIndex] = {};
                          }
                          _controller.chordMapping[lineIndex]![wordIndex] =
                              chord;
                        });
                      },
                    ),
                  ),
                  if (selectedLineIndex != null && selectedWordIndex != null)
                    TextField(
                      style: TextStyle(color: AppColor.secondaryColor),
                      controller: chordEditorController,
                      onChanged: _onChordEdited,
                      decoration: InputDecoration(
                        fillColor: AppColor.secondaryColor,
                        focusColor: AppColor.secondaryColor,
                        labelText:
                            'Edit Chord for "${_controller.lyric.text.split('\n')[selectedLineIndex!].split(' ')[selectedWordIndex!]}"',
                        border: OutlineInputBorder(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

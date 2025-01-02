import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/chords_edit/widgets/lyric_with_chords.dart';
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
        appBar: AppBar(
            backgroundColor: AppColor.backgroundColor,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/homeScreen");
                  _controller.saveLyrics();
                },
                icon: Icon(
                  Icons.check,
                  color: AppColor.secondaryColor,
                ),
              ),
            ],
            title: Column(
              children: [
                Text(
                  _controller.title.text,
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontFamily: "Cousine",
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Text(
                  _controller.artist.text,
                )
              ],
            )),
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
                  // DetailsWidget(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          // color: Color(0xFF000000),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Wrap(
                          spacing: 0.05.sw,
                          alignment: WrapAlignment.spaceBetween,
                          children: chords.map((chord) {
                            return LongPressDraggable<String>(
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
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                side: BorderSide(color: Colors.grey[300]!),
                                label: Text(chord),
                                backgroundColor: Colors.white,
                                labelStyle: TextStyle(color: Colors.black),
                                shadowColor: Colors.black.withOpacity(0.1),
                                elevation:
                                    5.0, // Higher elevation for a more pronounced shadow
                                // Darker shadow colo
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
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

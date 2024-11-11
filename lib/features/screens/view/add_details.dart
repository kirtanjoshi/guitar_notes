import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/chords_note_screen.dart';
import 'package:guitar_notes/global/constants/app_color.dart';
import 'package:guitar_notes/global/constants/app_fonts.dart';

class AddDetailScreen extends StatefulWidget {
  const AddDetailScreen({super.key});

  @override
  State<AddDetailScreen> createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {
  final FocusNode songNameFocusNode = FocusNode();
  final FocusNode artistFocusNode = FocusNode();
  final FocusNode capoFretFocusNode = FocusNode();
  final FocusNode strummingPatternFocusNode = FocusNode();
  final FocusNode lyricsFocusNode = FocusNode();

  final _controller = Get.put(LyricsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed("/chordsnoteScreen");
                });
              },
              icon: Icon(
                Icons.check,
                color: AppColor.secondaryColor,
              ),
            ),
          ],
          title: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: AppColor.secondaryColor,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 0, left: 30),
          child: Column(
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: _controller.title,
                    focusNode: songNameFocusNode,
                    style: TextStyle(
                        fontFamily: AppFonts.secondaryFont,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondaryColor),
                    onFieldSubmitted: (value) {
                      if (value.isNotEmpty) {
                        artistFocusNode.requestFocus();
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Song Name",
                      border: InputBorder.none,
                    ),
                  ),
                  TextFormField(
                    // controller: _controller.artist,
                    focusNode: artistFocusNode,
                    style: TextStyle(
                        fontFamily: AppFonts.secondaryFont,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondaryColor),
                    onFieldSubmitted: (value) {
                      capoFretFocusNode.requestFocus();
                    },
                    decoration: InputDecoration(
                      hintText: "Artist",
                      border: InputBorder.none,
                    ),
                  ),
                  TextFormField(
                    // controller: _controller.capo,
                    focusNode: capoFretFocusNode,
                    style: TextStyle(
                        fontFamily: AppFonts.secondaryFont,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondaryColor),
                    onFieldSubmitted: (value) {
                      strummingPatternFocusNode.requestFocus();
                    },
                    decoration: InputDecoration(
                      hintText: "Capo Fret",
                      border: InputBorder.none,
                    ),
                  ),
                  TextFormField(
                    // controller: _controller.strummingPattern,
                    focusNode: strummingPatternFocusNode,
                    style: TextStyle(
                        fontFamily: AppFonts.secondaryFont,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondaryColor),
                    onFieldSubmitted: (value) {
                      lyricsFocusNode.requestFocus();
                    },
                    decoration: InputDecoration(
                      hintText: "Strumming Pattern",
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
              Gap(30),
              Expanded(
                child: TextFormField(
                  controller: _controller.lyric,
                  focusNode: lyricsFocusNode,
                  maxLines: null,
                  style: TextStyle(
                      fontFamily: AppFonts.secondaryFont,
                      fontSize: 15,
                      color: AppColor.secondaryColor),
                  decoration: InputDecoration(
                    hintText: "Add your lyric here",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   // Dispose focus nodes when done to avoid memory leaks
  //   songNameFocusNode.dispose();
  //   artistFocusNode.dispose();
  //   capoFretFocusNode.dispose();
  //   strummingPatternFocusNode.dispose();
  //   lyricsFocusNode.dispose();
  //   super.dispose();
  // }
}

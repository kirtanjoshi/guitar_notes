import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
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

  final _formKey = GlobalKey<FormState>();

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
                  if (_formKey.currentState?.validate() ?? false) {
                    // If the form is valid, proceed (e.g., save data)
                    setState(() {
                      Navigator.of(context).pushNamed("/chordsnoteScreen");
                    });
                  } else {
                    // If the form is invalid, show a message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Please fill in all fields correctly')),
                    );
                  }
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
        body: Padding(
          padding: const EdgeInsets.only(top: 0, left: 30),
          child: Form(
            key: _formKey,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter song name';
                          }
                          return null;
                        }),
                    TextFormField(
                        controller: _controller.artist,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter artist name';
                          }
                          return null;
                        }),
                    TextFormField(
                        controller: _controller.capo,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter capo fret';
                          }
                          return null;
                        }),
                    TextFormField(
                        controller: _controller.strummingPattern,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter strumming pattern';
                          }
                          return null;
                        }),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter lyrics';
                        }
                        return null;
                      }),
                ),
              ],
            ),
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

import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
import 'package:guitar_notes/global/constants/app_color.dart';
import 'package:guitar_notes/global/constants/app_fonts.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required LyricsController controller,
    required this.songNameFocusNode,
    required this.artistFocusNode,
    required this.capoFretFocusNode,
    required this.strummingPatternFocusNode,
    required this.lyricsFocusNode,
  })  : _formKey = formKey,
        _controller = controller;

  final GlobalKey<FormState> _formKey;
  final LyricsController _controller;
  final FocusNode songNameFocusNode;
  final FocusNode artistFocusNode;
  final FocusNode capoFretFocusNode;
  final FocusNode strummingPatternFocusNode;
  final FocusNode lyricsFocusNode;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                  },
                  inputFormatters: [
                    // Ensures all text entered is converted to uppercase
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      return newValue.copyWith(
                        text: newValue.text.toUpperCase(),
                      );
                    }),
                  ],
                ),
              ],
            ),
            Gap(30),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () async {
                    await EasyLauncher.url(url: "https://google.com");
                  },
                  child: Text("Search lyric")),
            ),
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
    );
  }
}

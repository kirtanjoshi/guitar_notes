import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/controller/chords_controller.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

import 'add_form_widget.dart';

class AddChordsScreen extends StatefulWidget {
  const AddChordsScreen({super.key});

  @override
  State<AddChordsScreen> createState() => _AddChordsScreenState();
}

class _AddChordsScreenState extends State<AddChordsScreen> {
  final FocusNode songNameFocusNode = FocusNode();
  final FocusNode artistFocusNode = FocusNode();
  final FocusNode capoFretFocusNode = FocusNode();
  final FocusNode strummingPatternFocusNode = FocusNode();
  final FocusNode lyricsFocusNode = FocusNode();

  final _chordsController = Get.put(ChordsController());

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
                    _chordsController.addUser();
                    _chordsController.saveChords();
                    setState(() {
                      ();
                      Navigator.of(context).pushNamed("/homeScreen");
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
                  _chordsController.title.text,
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontFamily: "Cousine",
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Text(
                  _chordsController.artist.text,
                )
              ],
            )),
        body: Padding(
          padding: const EdgeInsets.only(top: 0, left: 30),
          child: FormWidget(
              formKey: _formKey,
              controller: _chordsController,
              songNameFocusNode: songNameFocusNode,
              artistFocusNode: artistFocusNode,
              capoFretFocusNode: capoFretFocusNode,
              strummingPatternFocusNode: strummingPatternFocusNode,
              lyricsFocusNode: lyricsFocusNode),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/add_details/widgets/form_widget.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

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
          child: FormWidget(
              formKey: _formKey,
              controller: _controller,
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

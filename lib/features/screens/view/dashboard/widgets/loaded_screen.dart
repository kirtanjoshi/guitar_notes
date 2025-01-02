import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
import 'package:guitar_notes/features/screens/view/save%20page/save_entities.dart';

class LoadedScreen extends StatelessWidget {
  const LoadedScreen({
    super.key,
    required LyricsController controller,
  }) : _controller = controller;

  final LyricsController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.05.sh),
      child: Obx(() {
        return ListView.builder(
          itemCount: _controller.entries.length,
          itemBuilder: (context, index) {
            final entry = _controller.entries[index];
            final title = entry['title'] as String;
            final artist = entry['artist'] as String;

            return Card(
              color: Color(0xFF79797F),
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inconsolata",
                  ),
                ),
                subtitle: Text(
                  artist,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inconsolata",
                  ),
                ),
                onTap: () {
                  // Navigate to SavedEntriesList with the selected entry
                  Get.to(
                    SavedEntriesList(
                      savedEntries: [entry],
                    ),
                    // Pass the selected song's details
                  );
                },
                onLongPress: () {
                  _controller.deleteEntry(entry['title']);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
